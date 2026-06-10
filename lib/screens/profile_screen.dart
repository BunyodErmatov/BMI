import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';
import '../utils/app_state.dart';
import 'about_screen.dart';
import 'language_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String studentName;
  final int totalTests;
  final double avgScore;

  const ProfileScreen({
    super.key,
    required this.studentName,
    required this.totalTests,
    required this.avgScore,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.5),
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.studentName.isNotEmpty
                              ? widget.studentName[0].toUpperCase()
                              : 'A',
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.studentName,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Info section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      L.t('my_info'),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _infoCard([
                      _infoRow(L.t('name_field'), widget.studentName),
                    ]),
                    const SizedBox(height: 20),

                    Text(
                      L.t('lang_settings'),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _infoCard([
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  const LanguageScreen(isFromSettings: true),
                            ),
                          );
                        },
                        child: _settingRow(
                          Icons.language_rounded,
                          L.t('lang_settings'),
                          AppState.language.value.toUpperCase(),
                          AppColors.primary,
                          trailing: Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textLight,
                            size: 20,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 20),

                    Text(
                      L.t('settings_title'),
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _infoCard([
                      _settingRow(
                        Icons.dark_mode_rounded,
                        L.t('dark_mode'),
                        '',
                        const Color(0xFF6B7280),
                        trailing: Switch(
                          value: AppState.isDark,
                          onChanged: (v) {
                            AppState.toggleDark(v);
                          },
                          activeThumbColor: AppColors.primary,
                        ),
                      ),
                      _divider(),
                      _settingRow(
                        Icons.notifications_rounded,
                        L.t('notifs'),
                        '',
                        AppColors.warning,
                        trailing: Switch(
                          value: _notifications,
                          onChanged: (v) => setState(() => _notifications = v),
                          activeThumbColor: AppColors.primary,
                        ),
                      ),
                      _divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const AboutScreen(),
                            ),
                          );
                        },
                        child: _settingRow(
                          Icons.info_outline_rounded,
                          L.t('about'),
                          L.t('version'),
                          AppColors.success,
                          trailing: Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textLight,
                            size: 20,
                          ),
                        ),
                      ),
                      _divider(),
                      GestureDetector(
                        onTap: () {
                          // "studentName" kaliti orqali Tizimdan chiqish (Ismni xotiradan tozalash / o'chirish)
                          AppState.prefs.remove('studentName');

                          // Tizimdan chiqilgandan keyin orqaga umuman qaytib bo'lmaydigan qilib yopish va
                          // Login ekranni (LoginScreen) boshidan ochish. (pushAndRemoveUntil)
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: _settingRow(
                          Icons.logout_rounded,
                          L.t('logout'),
                          '',
                          AppColors.error,
                          textColor: AppColors.error,
                          trailing: const SizedBox.shrink(),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        L.t('copyright'),
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.textMedium,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingRow(
    IconData icon,
    String label,
    String subtitle,
    Color iconColor, {
    required Widget trailing,
    Color? textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: textColor ?? AppColors.textDark,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: AppColors.textMedium,
                    ),
                  ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(height: 1, color: AppColors.divider, indent: 16);
  }
}
