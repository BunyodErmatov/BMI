import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';
import '../utils/app_state.dart';
import 'login_screen.dart';

class LanguageScreen extends StatefulWidget {
  final bool isFromSettings;
  const LanguageScreen({super.key, this.isFromSettings = false});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late String _selectedCode;

  final List<Map<String, String>> _languages = [
    {'name': "O'zbek tili", 'flag': '🇺🇿', 'code': 'uz'},
    {'name': 'Русский', 'flag': '🇷🇺', 'code': 'ru'},
    {'name': 'English', 'flag': '🇺🇸', 'code': 'en'},
  ];

  @override
  void initState() {
    super.initState();
    _selectedCode = AppState.language.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: widget.isFromSettings
          ? AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.textDark,
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                L.t('lang_settings'),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!widget.isFromSettings) const SizedBox(height: 60),
              // Title
              if (!widget.isFromSettings) ...[
                Text(
                  L.t('choose_language'),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  L.t('language_hint'),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.textMedium,
                  ),
                ),
                const SizedBox(height: 48),
              ],

              if (widget.isFromSettings) const SizedBox(height: 24),

              // Language cards
              ..._languages.map((lang) {
                final isSelected = _selectedCode == lang['code'];
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedCode = lang['code']!);
                    AppState.setLanguage(lang['code']!);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.06)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.border,
                        width: isSelected ? 2 : 1.5,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(
                                  alpha: 0.12,
                                ),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          lang['flag']!,
                          style: const TextStyle(fontSize: 26),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          lang['name']!,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textDark,
                          ),
                        ),
                        const Spacer(),
                        if (isSelected)
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14,
                            ),
                          )
                        else
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.border,
                                width: 2,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),

              const Spacer(),

              // Continue button
              if (!widget.isFromSettings)
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    L.t('continue_btn'),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (!widget.isFromSettings) const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
