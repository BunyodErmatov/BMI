import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'utils/app_colors.dart';
import 'utils/app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([AppState.themeMode, AppState.language]),
      builder: (context, _) {
        return MaterialApp(
          title: 'Quiz App',
          debugShowCheckedModeBanner: false,
          themeMode: AppState.themeMode.value,
          // ── Light theme ──
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
          // ── Dark theme ──
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
          home: const SplashScreen(),
        );
      },
    );
  }
}
