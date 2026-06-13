import 'package:flutter/material.dart';

/// Responsive Util sinfi: Ekran o'lchamiga qarab shriftlar va bo'shliqlarni
/// avtomatik moslashtirib beruvchi yordamchi klass.
/// Base dizayn 375x812 (iPhone X) asosida qurilgan.
class Responsive {
  static late double _screenWidth;
  static late double _screenHeight;

  /// init() ni har bir sahifaning build() metodida chaqiramiz
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _screenWidth = size.width;
    _screenHeight = size.height;
  }

  /// Ekran kengligi
  static double get screenWidth => _screenWidth;

  /// Ekran balandligi
  static double get screenHeight => _screenHeight;

  /// Kenglik bo'yicha foizni hisoblash (m: wp(50) = ekranninng 50% kengligi)
  static double wp(double percent) => _screenWidth * percent / 100;

  /// Balandlik bo'yicha foizni hisoblash (m: hp(10) = ekranninng 10% balandligi)
  static double hp(double percent) => _screenHeight * percent / 100;

  /// Shrift o'lchamini ekran kengligiga qarab scale qilish
  /// Base: 375 kenglikdagi dizayn uchun
  static double sp(double fontSize) {
    final scaleFactor = _screenWidth / 375;
    return fontSize *
        scaleFactor.clamp(0.8, 1.3); // 0.8x dan 1.3x gacha chegaralanadi
  }

  /// Telefon kichkina ekranmi (kenglik < 360)
  static bool get isSmall => _screenWidth < 360;

  /// Planshet yoki katta ekranmi (kenglik >= 600)
  static bool get isTablet => _screenWidth >= 600;
}
