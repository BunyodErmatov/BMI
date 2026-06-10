import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';

class StatisticsScreen extends StatelessWidget {
  final int totalTests;
  final double avgScore;
  final double bestScore;
  final List<Map<String, dynamic>> recentResults;
  final Function(int)? onDeleteResult;

  const StatisticsScreen({
    super.key,
    required this.totalTests,
    required this.avgScore,
    required this.bestScore,
    required this.recentResults,
    this.onDeleteResult,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                L.t('stat_title'),
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 24),

              // Barchart placeholder
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          L.t('results_analysis'),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                        Text(
                          L.t('last_7'),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.textMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Fake bar chart
                    SizedBox(
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _barChartBar(45, 'Du'),
                          _barChartBar(60, 'Se'),
                          _barChartBar(85, 'Ch'),
                          _barChartBar(30, 'Pa'),
                          _barChartBar(95, 'Ju'),
                          _barChartBar(70, 'Sh'),
                          _barChartBar(100, 'Ya', isActive: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Recent tests
              Text(
                L.t('recent_results'),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),

              if (recentResults.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      'Hozircha natijalar yo\'q',
                      style: GoogleFonts.poppins(
                        color: AppColors.textLight,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              else
                ...recentResults.asMap().entries.map(
                  (e) => _resultCard(e.value, e.key),
                ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _barChartBar(double percentage, String day, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 28,
          height: 120 * (percentage / 100),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          day,
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive ? AppColors.primary : AppColors.textMedium,
          ),
        ),
      ],
    );
  }

  // Natijani bitta kartochkasi qanday chizilishi
  Widget _resultCard(Map<String, dynamic> item, int index) {
    final Color color = item['color'];
    final bool passed =
        item['score'] >= 60; // 60 dan yuqori ballni to'g'ri deb qabul qilish

    // Dismissible = Elementni barmog'imiz bilan Chapga yoki o'ngga surganimizda (Swipe) o'chirish imkonini beruvchi maxsus Widget
    return Dismissible(
      key:
          UniqueKey(), // Har bir kartochkani aniq topib o'chirish uchun Noyob Kalit
      direction: DismissDirection
          .endToStart, // Faqat O'ngdan-Chapga surilganda ishlaydi
      background: Container(
        // Surilayotgan payt orqasidan ko'rinib keladigan Qizil o'chirish Ikonkasi (UI xavfsizlik va go'zallik)
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete_rounded, color: Colors.white),
      ),
      // Oxirigacha surib bo'lingandan so'ng xotiradan (MainShell dagi removeResult) index boyicha tozalab yuborish
      onDismissed: (_) => onDeleteResult?.call(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  item['icon'],
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['subject'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 12,
                        color: AppColors.textMedium,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item['date'],
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.textMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: passed
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${item['score']}%',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: passed ? AppColors.success : AppColors.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
