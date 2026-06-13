import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_localizations.dart';
import '../models/question_model.dart';
import 'results_screen.dart';

class QuizScreen extends StatefulWidget {
  final SubjectModel subject;
  final Function(Map<String, dynamic>) onFinished;

  const QuizScreen({
    super.key,
    required this.subject,
    required this.onFinished,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int? _selectedOption;
  int _correctCount = 0;
  int _wrongCount = 0;
  int _secsRemaining = 14 * 60 + 32; // 14:32
  Timer? _timer;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_secsRemaining > 0) {
        setState(() => _secsRemaining--);
      } else {
        _finishQuiz();
      }
    });
  }

  // Variant tanlanganda ishga tushadigan tekshiruv (Tekshiruv logikasi)
  void _selectOption(int index) {
    if (_answered) return; // Ikki marta bosilib ketishni oldini olish
    setState(() {
      _selectedOption = index;
      _answered = true;
      // Tanlangan index Asosiy (To'g'ri) index bilan bir xil ekani tekshiriladi
      if (index == widget.subject.questions[_currentIndex].correctIndex) {
        _correctCount++; // To'g'ri javobga +1
      } else {
        _wrongCount++; // Xato javobga +1
      }
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (_currentIndex < widget.subject.questions.length - 1) {
        setState(() {
          _currentIndex++;
          _selectedOption = null;
          _answered = false;
        });
      } else {
        _finishQuiz();
      }
    });
  }

  // Test to'liq tugatilganda Natijani (Score, subject) chiqarib berish va Home oynasiga xabar qilish
  void _finishQuiz() {
    _timer?.cancel(); // Vaqt hisoblashni to'xtatish
    final total = widget.subject.questions.length;
    final score = (_correctCount / total * 100)
        .round(); // Foiz hisoblash m: 24/25*100

    // Nomi lokalizatsiya qilingan (Hali tarjima logikasi ulanmagan original name qoladi)
    final result = {
      'subject': widget.subject.name,
      'date':
          '${DateTime.now().day.toString().padLeft(2, '0')}.${DateTime.now().month.toString().padLeft(2, '0')}.${DateTime.now().year}',
      'score': score,
      'icon': widget.subject.icon,
      'color': widget.subject.color,
    };
    // ResultScreen dan oldin callback orqali MainShell ga statistika yig'ishtiriladi
    widget.onFinished(result);

    // Natijalar (ResultsScreen) oynasiga yo'naltirish
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ResultsScreen(
          correctCount: _correctCount,
          wrongCount: _wrongCount,
          totalCount: total,
          score: score,
        ),
      ),
    );
  }

  String get _timeString {
    final m = _secsRemaining ~/ 60;
    final s = _secsRemaining % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.subject.questions[_currentIndex];
    final total = widget.subject.questions.length;
    final progress = (_currentIndex + 1) / total;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textDark),
        title: Text(
          '${L.t('question_of')} ${_currentIndex + 1} / $total',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primarySurface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.timer_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  _timeString,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        // SafeArea - landscape holatda notch/toolbar bilan to'qnashuvni oldini oladi
        child: Column(
          children: [
            // Progress bar (savollar qancha qolganini ko'rsatuvchi chiziq)
            Container(
              height: 4,
              color: AppColors.white,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                  ),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Question card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            q.askQuestion,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textDark,
                              height: 1.5,
                            ),
                          ),
                          if (q.formula != null) ...[
                            const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primarySurface,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                q.formula!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Options (A, B, C, D variantlar)
                    ...List.generate(q.askOptions.length, (i) {
                      final label = String.fromCharCode(65 + i); // A, B, C, D
                      Color bgColor = AppColors.white;
                      Color borderColor = AppColors.border;
                      Color textColor = AppColors.textDark;
                      Color labelBg = AppColors.divider;
                      Color labelText = AppColors.textMedium;

                      if (_answered) {
                        if (i == q.correctIndex) {
                          bgColor = AppColors.success.withValues(alpha: 0.08);
                          borderColor = AppColors.success;
                          textColor = AppColors.success;
                          labelBg = AppColors.success;
                          labelText = Colors.white;
                        } else if (i == _selectedOption &&
                            i != q.correctIndex) {
                          bgColor = AppColors.error.withValues(alpha: 0.08);
                          borderColor = AppColors.error;
                          textColor = AppColors.error;
                          labelBg = AppColors.error;
                          labelText = Colors.white;
                        }
                      } else if (_selectedOption == i) {
                        bgColor = AppColors.primarySurface;
                        borderColor = AppColors.primary;
                        textColor = AppColors.primary;
                        labelBg = AppColors.primary;
                        labelText = Colors.white;
                      }

                      return GestureDetector(
                        onTap: () => _selectOption(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor, width: 1.5),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: labelBg,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    label,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: labelText,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  q.askOptions[i],
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // Bottom bar (To'g'ri/Xato hisobi va Keyingi tugma)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: AppColors.white,
              child: Row(
                children: [
                  _quizStat(
                    Icons.check_circle_rounded,
                    '$_correctCount',
                    AppColors.success,
                  ),
                  const SizedBox(width: 12),
                  _quizStat(
                    Icons.cancel_rounded,
                    '$_wrongCount',
                    AppColors.error,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _answered
                        ? () {
                            if (_currentIndex < total - 1) {
                              setState(() {
                                _currentIndex++;
                                _selectedOption = null;
                                _answered = false;
                              });
                            } else {
                              _finishQuiz();
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      disabledBackgroundColor: AppColors.border,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _currentIndex < total - 1
                              ? L.t('next_q')
                              : L.t('finish'),
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          _currentIndex < total - 1
                              ? Icons.arrow_forward_rounded
                              : Icons.check_circle_outline,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quizStat(IconData icon, String value, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 4),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}
