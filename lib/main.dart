import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'utils/app_colors.dart';
import 'utils/app_state.dart';

void main() async {
  // Dastur ishga tushishidan oldin Flutter dvigateli to'liq tayyor ekanini tekshiradi
  WidgetsFlutterBinding.ensureInitialized();

  // AppState yordamida SharedPreferences  ni ilova ochilganda ulab o'qiymiz
  await AppState.init();

  // Status bar (tepadagi batareya, soat chiqadigan joy) dizaynini o'rnatish
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Orqa fonni shaffof qilish
      statusBarIconBrightness: Brightness.dark, // Ikonkalarni qoraytirish
    ),
  );
  runApp(const QuizApp());
}

// Ilovaning asosiy vidjeti (Yuragi)
class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder ilovaning butunlay tarjimasi yoki dark mode bo'lganda ushbu qatlamdan yangilash(rebuild) uchun xizmat qiladi
    return AnimatedBuilder(
      // Bu yerda themeMode va language ga quloq tutamiz, ular o'zgarsa ilova qayta chiziladi
      animation: Listenable.merge([AppState.themeMode, AppState.language]),
      builder: (context, _) {
        // MaterialApp barcha oynalarni, navigatsiyani ta'minlaydigan ildiz hisoblanadi
        return MaterialApp(
          title: 'Quiz App',
          debugShowCheckedModeBanner:
              false, // Ekran burchagidagi "DEBUG" belgisini olib tashlash
          themeMode: AppState
              .themeMode
              .value, // Ilovaning temasi qaysi rejimda ekanligi aniqlanadi
          // ── Light theme ── (Yorug' tema uchun sozlamalar)
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.textDark),
            ),
            switchTheme: SwitchThemeData(
              thumbColor: WidgetStateProperty.resolveWith(
                (s) =>
                    s.contains(WidgetState.selected) ? AppColors.white : null,
              ),
              trackColor: WidgetStateProperty.resolveWith(
                (s) =>
                    s.contains(WidgetState.selected) ? AppColors.primary : null,
              ),
            ),
          ),
          // ── Dark theme ── (Tungi qorong'u tema sozlamalari)
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(
              ThemeData(brightness: Brightness.dark).textTheme,
            ),
            scaffoldBackgroundColor: const Color(0xFF0F172A),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1E293B),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            cardColor: const Color(0xFF1E293B),
            switchTheme: SwitchThemeData(
              thumbColor: WidgetStateProperty.resolveWith(
                (s) =>
                    s.contains(WidgetState.selected) ? AppColors.white : null,
              ),
              trackColor: WidgetStateProperty.resolveWith(
                (s) =>
                    s.contains(WidgetState.selected) ? AppColors.primary : null,
              ),
            ),
          ),
          // Asosiy ochilib beruvchi birinchi sahifa (Splash Screen) beriladi
          home: const SplashScreen(),
        );
      },
    );
  }
}
