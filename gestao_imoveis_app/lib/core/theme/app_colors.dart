import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const primary = Color(0xFF1E3A5F);
  static const primaryLight = Color(0xFF2C5F8A);

  // Semantic
  static const success = Color(0xFF27AE60);
  static const warning = Color(0xFFF39C12);
  static const danger = Color(0xFFE74C3C);
  static const neutral = Color(0xFF6C757D);

  // Background light
  static const backgroundLight = Color(0xFFF0F4F8);
  static const surfaceLight = Color(0xFFFFFFFF);

  // Background dark
  static const backgroundDark = Color(0xFF0D1B2A);
  static const surfaceDark = Color(0xFF152231);

  // Text light
  static const textPrimaryLight = Color(0xFF1E3A5F);
  static const textSecondaryLight = Color(0xFF6C757D);

  // Text dark
  static const textPrimaryDark = Color(0xFFE8EDF5);
  static const textSecondaryDark = Color(0xFF8FA3B8);
}
