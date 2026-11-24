import 'package:flutter/material.dart';

/// สีประมาณจากภาพดีไซน์ Figma — ปรับค่า hex ให้ตรงด้วย Dev Mode ได้ที่นี่ที่เดียว
class AppColors {
  static const bg = Color(0xFFE6F0FA);
  static const primary = Color(0xFF0B74B0);
  static const navy = Color(0xFF17324D);
  static const muted = Color(0xFF5B6F82);
  static const olive = Color(0xFFA8B26B);
  static const slate = Color(0xFFA9B8C8);
  static const accent = Color(0xFFA3B35C);
  static const border = Color(0xFFB8CCE0);
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
  ),
  scaffoldBackgroundColor: AppColors.bg,
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: AppColors.navy,
        displayColor: AppColors.navy,
      ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    hintStyle: const TextStyle(color: AppColors.muted, fontSize: 13),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
  ),
);