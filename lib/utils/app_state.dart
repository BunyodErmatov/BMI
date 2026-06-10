import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

/// AppState sinfi: Global application state yani ilovaning global holati.
/// Bu yerda tungi rejim va til kabi doimiy saqlanishi kerak bo'lgan sozlamalar ValueNotifier yordamida uzluksiz chiziladi.
class AppState {
  AppState._(); // Obyekt yaratilishini oldini olish uchun yopiq konstruktor

  // Interfeys (UI) ni avtomatik o'zgartiruvchi variable turidagi o'zgaruvchilar (State boshqaruvi uchun ValueNotifier olingan)
  static final themeMode = ValueNotifier<ThemeMode>(ThemeMode.light);
  static final language = ValueNotifier<String>(
    'uz',
  ); // Qo'llab quvvatlanuvchi tillar: 'uz' | 'ru' | 'en'

  // Mahalliy (local) ma'lumotlar bazasi vazifasini bajaruvchi
  static late SharedPreferences prefs;

  // Dastur qora mavzuda (Dark mode) ekanini tekshiruvchi yordamchi GETTER
  static bool get isDark => themeMode.value == ThemeMode.dark;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();

    // Load language
    final savedLang = prefs.getString('language');
    if (savedLang != null) {
      language.value = savedLang;
    }

    // Load theme
    final savedIsDark = prefs.getBool('isDark');
    if (savedIsDark != null) {
      themeMode.value = savedIsDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  // Tungi rejimga o'tkazish funksiyasi. Bu yerda yangi qiymat bazaga doimiy yozib qo'yiladi hamsda UI chiziladi.
  static void toggleDark(bool dark) {
    themeMode.value = dark ? ThemeMode.dark : ThemeMode.light;
    prefs.setBool('isDark', dark); // setBool - bazaga bool(mantiqiy) yozish
  }

  // Tilni almashtirish
  static void setLanguage(String code) {
    language.value = code;
    prefs.setString('language', code); // setString - bazaga string(matn) yozish
  }
}
