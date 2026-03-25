import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Base
  static const Color background = Color(0xFFF8FAFC); // Very light grey/blue
  static const Color surface = Color(0xFFFFFFFF);
  
  // Silver Gradients
  static const Color silverLight = Color(0xFFE2E8F0);
  static const Color silverDark = Color(0xFF94A3B8);
  static const Color silverBorder = Color(0xFFCBD5E1);

  // Modern Accents (Soft Teal)
  static const Color primary = Color(0xFF2DD4BF);
  static const Color primaryDark = Color(0xFF0F766E);
  static const Color accent = Color(0xFF38BDF8); // Light Blue

  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);

  // Gradient definitions
  static const LinearGradient silverGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF1F5F9), // Lighter Silver
      Color(0xFFE2E8F0), // Base Silver
      Color(0xFFCBD5E1), // Darker Silver
    ],
  );
}
