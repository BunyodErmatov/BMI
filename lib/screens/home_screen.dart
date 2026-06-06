import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';
import '../utils/app_state.dart';
import 'language_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  final String studentName;
  final int totalTests;
  final double avgScore;
  final double bestScore;
  final VoidCallback onStartTest;

  HomeScreen({
    super.key,
    required this.studentName,
    required this.totalTests,
    required this.avgScore,
    required this.bestScore,
    required this.onStartTest,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Top bar
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    child: Icon(
                      Icons.menu_rounded,
                      color: AppColors.textDark,
                      size: 28,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Hozircha yangi bildirishnomalar yo'q"),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Icon(
                        Icons.notifications_none_rounded,
                        color: AppColors.textDark,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Greeting
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${L.t('welcome')} ',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textMedium,
                      ),
                    ),
                    TextSpan(
                      text: '$studentName! ',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    const TextSpan(text: '👋', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                L.t('welcome_sub'),
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: AppColors.textMedium,
                ),
              ),
              const SizedBox(height: 28),

              // Mashhur fanlar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    L.t('popular'),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  GestureDetector(
                    onTap: onStartTest,
                    child: Text(
                      L.t('all'),
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Fan cards horizontal scroll
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _subjectCard(
                      L.t('math'),
                      '25 ${L.t('tests_count')}',
                      'Σ',
                      const Color(0xFF7C3AED),
                    ),
                    _subjectCard(
                      L.t('coding'),
                      '25 ${L.t('tests_count')}',
                      '</>',
                      const Color(0xFF0891B2),
                    ),
                    _subjectCard(
                      L.t('english'),
                      '25 ${L.t('tests_count')}',
                      'EN',
                      const Color(0xFF059669),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Start test button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: onStartTest,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            L.t('start_test'),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Statistika
              Text(
                L.t('statistics'),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  _statCard(
                    L.t('tests_taken'),
                    totalTests.toString(),
                    Icons.assignment_turned_in_rounded,
                    AppColors.primary,
                  ),
                  const SizedBox(width: 12),
                  _statCard(
                    L.t('avg_score'),
                    '${avgScore.toInt()}%',
                    Icons.trending_up_rounded,
                    AppColors.success,
                  ),
                  const SizedBox(width: 12),
                  _statCard(
                    L.t('best_score'),
                    '${bestScore.toInt()}%',
                    Icons.emoji_events_rounded,
                    AppColors.warning,
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      studentName.isNotEmpty
                          ? studentName[0].toUpperCase()
                          : 'A',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    studentName,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.language_rounded, color: AppColors.textDark),
            title: Text(
              L.t('drawer_lang'),
              style: GoogleFonts.poppins(color: AppColors.textDark),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LanguageScreen(isFromSettings: true),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode_rounded, color: AppColors.textDark),
            title: Text(
              L.t('dark_mode'),
              style: GoogleFonts.poppins(color: AppColors.textDark),
            ),
            trailing: Switch(
              value: AppState.isDark,
              onChanged: (v) => AppState.toggleDark(v),
              activeThumbColor: AppColors.primary,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline_rounded,
              color: AppColors.textDark,
            ),
            title: Text(
              L.t('drawer_about'),
              style: GoogleFonts.poppins(color: AppColors.textDark),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _subjectCard(String name, String count, String icon, Color color) {
    return GestureDetector(
      onTap: onStartTest,
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  icon,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  count,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: AppColors.textMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 6),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 9,
                color: AppColors.textMedium,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
