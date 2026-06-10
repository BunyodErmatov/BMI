import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';

// Test yakunida ko'rsatiladigan Natija (Results) ekrani
class ResultsScreen extends StatelessWidget {
  // Avvalgi (QuizScreen) dan oqib keladigan ma'lumotlar
  final int correctCount; // To'g'ri topilganlar soni
  final int wrongCount; // Xato qilinganlar soni
  final int totalCount; // Jami savollar soni
  final int score; // Bali (%)

  const ResultsScreen({
    super.key,
    required this.correctCount,
    required this.wrongCount,
    required this.totalCount,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    // Baholash logikasi: Agar 60 foizdan yuqori to'plansa "O'tdi" degan mantiq ishlaydi
    bool isPassed = score > 60;

    // O'tgan bo'lsa Yashil (Success), Aks holda Qizil (Warning/Error) rang beramiz
    Color resultColor = isPassed ? AppColors.success : AppColors.warning;

    // Yuzidagi ikonkasini ham shunga qarab almashtiramiz: O'tsa (Kubok), o'tolmasa (Qayta urunish-Replay) ikonkasini ko'rsatamiz
    IconData resultIcon = isPassed
        ? Icons.emoji_events_rounded
        : Icons.replay_rounded;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              // Header
              Text(
                L.t('quiz_done'),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 40),

              // Score Circle
              Center(
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: resultColor.withValues(alpha: 0.15),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        // Bu qism Dumaloq orqali Olinag ball vizualizatsiyasini yasaydi chiziq ko'rinishida
                        child: CircularProgressIndicator(
                          value:
                              score /
                              100, // Foizni 0..1 gacha decimal(o'nlik) formatda beradi
                          strokeWidth: 12, // Chiziq qalinligi
                          backgroundColor: AppColors.divider,
                          color: resultColor,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(resultIcon, color: resultColor, size: 36),
                          const SizedBox(height: 8),
                          Text(
                            '$score%',
                            style: GoogleFonts.poppins(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                          Text(
                            L.t('your_score'),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              Text(
                score >= 80
                    ? L.t('msg_excellent')
                    : score >= 60
                    ? L.t('msg_good')
                    : L.t('msg_try'),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: resultColor,
                ),
              ),
              const SizedBox(height: 32),

              // Details
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    _detailRow(
                      L.t('correct'),
                      '$correctCount',
                      AppColors.success,
                    ),
                    const SizedBox(height: 16),
                    _detailRow(L.t('wrong'), '$wrongCount', AppColors.error),
                    const SizedBox(height: 16),
                    Divider(color: AppColors.divider),
                    const SizedBox(height: 16),
                    _detailRow(
                      L.t('total_q'),
                      '$totalCount',
                      AppColors.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Action Buttons (Pastdagi tugmalar)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      // "Qayta urunish" (Retry) tugmasiga bosilganda oyna orqaga bitta suriladi, ya'ni Home pagedan yana yangidan Test ekraniga qaytilishi kerak
                      onPressed: () {
                        Navigator.pop(context); // Oynani yopish
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: AppColors.primary, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          L.t('retry'),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: Center(
                        child: Text(
                          L.t('go_home'),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textMedium,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
