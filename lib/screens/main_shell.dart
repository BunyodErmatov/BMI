import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';
import '../utils/app_state.dart';
import '../utils/database_helper.dart'; // SQLite baza yordamchi sinfi
import 'home_screen.dart';
import 'subjects_screen.dart';
import 'statistics_screen.dart';
import 'profile_screen.dart';

class MainShell extends StatefulWidget {
  final String studentName;

  const MainShell({super.key, required this.studentName});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  // Dastur ishga tushganda o'qiladigan lokal o'zgaruvchilar
  int _totalTests = 0;
  double _avgScore = 0.0;
  double _bestScore = 0.0;
  List<Map<String, dynamic>> _recentResults = [];

  // SQLite DatabaseHelper obyekti — bazaga murojaat qilish uchun
  final _db = DatabaseHelper();

  // Mahalliy ma'lumotlar bazasidan testlar tarixini o'qib kelish
  // Ham SharedPreferences ham SQLite dan foydalaniladi (ikkala usul parallel ishlaydi)
  void _loadData() {
    // 1) SharedPreferences dan statistika summalarini o'qish (tez o'qiladi)
    _totalTests = AppState.prefs.getInt('totalTests') ?? 0;
    _avgScore = AppState.prefs.getDouble('avgScore') ?? 0.0;
    _bestScore = AppState.prefs.getDouble('bestScore') ?? 0.0;

    // 2) SQLite dan batafsil natijalar ro'yxatini o'qib olish (async)
    _loadFromSQLite();
  }

  /// SQLite baza dan natijalarni asinxron o'qish
  Future<void> _loadFromSQLite() async {
    // DatabaseHelper.getAllResults() barcha yozuvlarni qaytaradi
    final rows = await _db.getAllResults();

    if (rows.isEmpty) {
      // SQLite bo'sh bo'lsa SharedPreferences dan JSON o'qib olamiz (Eski baza)
      final resultStr = AppState.prefs.getString('recentResults');
      if (resultStr != null) {
        final List decoded = jsonDecode(resultStr);
        if (mounted) {
          setState(() {
            _recentResults = decoded
                .map(
                  (e) => {
                    'subject': e['subject'],
                    'date': e['date'],
                    'score': e['score'],
                    'icon': e['icon'],
                    'color': Color(e['colorValue'] ?? 0xFF000000),
                  },
                )
                .toList()
                .cast<Map<String, dynamic>>();
          });
        }
      }
      return;
    }

    // SQLite yozuvlarini Flutter uchun qulay formatga o'giramiz
    if (mounted) {
      setState(() {
        _recentResults = rows
            .map(
              (row) => {
                'id': row['id'], // O'chirish uchun kerak
                'subject': row['subject'],
                'date': row['date'],
                'score': row['score'],
                'icon': row['icon'],
                'color': Color(
                  row['color_value'] as int,
                ), // int raqamdan Rang obyektiga
              },
            )
            .toList();
      });
    }
  }

  // Umumiy ko'rsatkichlarni (O'rtacha ball, Eng yuqori ball) matematik hisoblash
  void _updateStats() {
    if (_recentResults.isEmpty) {
      _avgScore = 0.0;
      _bestScore = 0.0;
      _totalTests = 0;
      return;
    }
    _totalTests = _recentResults.length;
    double sum = 0;
    double best = 0;
    for (var r in _recentResults) {
      double score = (r['score'] as num).toDouble();
      sum += score;
      if (score > best) best = score; // Rekord yangilanishi
    }
    _avgScore =
        sum /
        _recentResults
            .length; // Umumiy uchni testlar soniga bo'lish (O'rtacha miqdor)
    _bestScore = best;
  }

  // Natijalarni yig'ib xotiraga ham SharedPreferences ham SQLite ga yozib qoyish
  void _saveData() {
    // SharedPreferences ga statistika summalarini tez saqlash
    AppState.prefs.setInt('totalTests', _totalTests);
    AppState.prefs.setDouble('avgScore', _avgScore);
    AppState.prefs.setDouble('bestScore', _bestScore);

    // SharedPreferences ga to'liq ro'yxatni JSON formatida ham saqlaymiz (zaxira)
    final String resultStr = jsonEncode(
      _recentResults
          .map(
            (e) => {
              'subject': e['subject'],
              'date': e['date'],
              'score': e['score'],
              'icon': e['icon'],
              'colorValue': (e['color'] as Color).value,
            },
          )
          .toList(),
    );
    AppState.prefs.setString(
      'recentResults',
      resultStr,
    ); // SharedPreferences ga yozish
  }

  // Yangi ishlangan test kelib tushganda funksiya shu yerdan eng birinchi bo'lib ro'yxatga kiritadi
  void addResult(Map<String, dynamic> result) {
    setState(() {
      _recentResults.insert(
        0,
        result,
      ); // 0-indeks: ro'yxatni eng boshiga qoshish
      _updateStats(); // Matematik hisoblash chaqiriladi
      _saveData(); // SharedPreferences ga saqlash
    });
    // SQLite ga ham yozamiz (Parallel, asinxron)
    _db.insertResult(result).then((insertedId) {
      // Kiritilgan yozuvning ID sini saqlaymiz (O'chirishda kerak bo'ladi)
      if (mounted) {
        setState(() {
          _recentResults.first['id'] = insertedId;
        });
      }
    });
  }

  // Statistikadan Swipe (surilib o'chirilishi bilan shu funksiya ishlaydi)
  void removeResult(int index) {
    // O'chirilayotgan natijaning SQLite ID sini olamiz
    final resultId = _recentResults[index]['id'] as int?;

    setState(() {
      _recentResults.removeAt(index);
      _updateStats();
      _saveData();
    });

    // SQLite dan ID orqali o'chirish (agar ID mavjud bo'lsa)
    if (resultId != null) {
      _db.deleteResult(resultId);
    }
  }

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _loadData();
    _buildScreens();
  }

  void _buildScreens() {
    _screens = [
      HomeScreen(
        studentName: widget.studentName,
        totalTests: _totalTests,
        avgScore: _avgScore,
        bestScore: _bestScore,
        onStartTest: () => setState(() => _currentIndex = 1),
      ),
      SubjectsScreen(
        onSubjectSelected: (s) {},
        onResultAdded: (r) {
          addResult(r);
          _buildScreens();
        },
      ),
      StatisticsScreen(
        totalTests: _totalTests,
        avgScore: _avgScore,
        bestScore: _bestScore,
        recentResults: _recentResults,
        onDeleteResult: (i) {
          removeResult(i);
          _buildScreens();
        },
      ),
      ProfileScreen(
        studentName: widget.studentName,
        totalTests: _totalTests,
        avgScore: _avgScore,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _buildScreens();
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(0, Icons.home_rounded, L.t('drawer_home')),
                _navItem(1, Icons.book_rounded, L.t('drawer_subjects')),
                _navItem(2, Icons.bar_chart_rounded, L.t('drawer_stats')),
                _navItem(3, Icons.person_rounded, L.t('drawer_profile')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, String label) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.primary : AppColors.navInactive,
              size: 22,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? AppColors.primary : AppColors.navInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
