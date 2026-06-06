import 'package:flutter/material.dart';
import 'app_state.dart';

class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static Color get primarySurface =>
      AppState.isDark ? const Color(0xFF1E293B) : const Color(0xFFEFF6FF);

  // Background
  static Color get background =>
      AppState.isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFF);
  static Color get white =>
      AppState.isDark ? const Color(0xFF1E293B) : const Color(0xFFFFFFFF);
  static Color get cardBg =>
      AppState.isDark ? const Color(0xFF1E293B) : const Color(0xFFFFFFFF);

  // Text
  static Color get textDark =>
      AppState.isDark ? const Color(0xFFF8FAFF) : const Color(0xFF1E293B);
  static Color get textMedium =>
      AppState.isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569);
  static Color get textLight =>
      AppState.isDark ? const Color(0xFF475569) : const Color(0xFF94A3B8);

  // Subject colors
  static const Color mathColor = Color(0xFF7C3AED);
  static const Color codingColor = Color(0xFF0891B2);
  static const Color englishColor = Color(0xFF059669);
  static const Color historyColor = Color(0xFFD97706);
  static const Color physicsColor = Color(0xFFDC2626);

  // Feedback
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  // Border & divider
  static Color get border =>
      AppState.isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
  static Color get divider =>
      AppState.isDark ? const Color(0xFF334155) : const Color(0xFFF1F5F9);

  // Bottom nav
  static Color get navInactive =>
      AppState.isDark ? const Color(0xFF64748B) : const Color(0xFFCBD5E1);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1D4ED8), Color(0xFF3B82F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient get splashGradient => AppState.isDark
      ? const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      : const LinearGradient(
          colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
}
