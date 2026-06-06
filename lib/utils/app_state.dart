import 'package:flutter/material.dart';

/// Global application state — dark mode + language
class AppState {
  AppState._();

  static final themeMode = ValueNotifier<ThemeMode>(ThemeMode.light);
  static final language = ValueNotifier<String>('uz'); // 'uz' | 'ru' | 'en'

  static bool get isDark => themeMode.value == ThemeMode.dark;

  static void toggleDark(bool dark) {
    themeMode.value = dark ? ThemeMode.dark : ThemeMode.light;
  }

  static void setLanguage(String code) {
    language.value = code;
  }
}
