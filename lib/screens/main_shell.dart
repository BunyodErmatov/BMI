import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';
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

  int _totalTests = 12;
  final double _avgScore = 78;
  final double _bestScore = 92;
  final List<Map<String, dynamic>> _recentResults = [
    {
      'subject': 'Matematika testi',
      'date': '20.01.2024',
      'score': 85,
      'icon': 'Σ',
      'color': Color(0xFF7C3AED),
    },
    {
      'subject': 'Dasturlash testi',
      'date': '18.01.2024',
      'score': 70,
      'icon': '</>',
      'color': Color(0xFF0891B2),
    },
  ];

  void addResult(Map<String, dynamic> result) {
    setState(() {
      _recentResults.insert(0, result);
      _totalTests++;
    });
  }

  void removeResult(int index) {
    setState(() {
      _recentResults.removeAt(index);
    });
  }

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
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
