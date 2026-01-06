import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const primaryBlue = Color(0xFF6DB5D4);
  static const primaryBlueLight = Color(0xFF9FCFE5);
  static const darkBlue = Color(0xFF5A9BB8);
  
  // Secondary colors
  static const primaryPink = Color(0xFFD8476E);
  static const primaryRed = Color(0xFFE74C6F);
  static const softRed = Color(0xFFF25A7C);
  
  // Background colors
  static const backgroundColor = Color(0xFFF8F9FA);
  static const cardBackground = Colors.white;
  static const lightBlue = Color(0xFFB8D9E8);
  static const softBlueBackground = Color(0xFFD0E8F2);
  
  // Text colors
  static const textPrimary = Color(0xFF1A1A1A);
  static const textSecondary = Color(0xFF6B7280);
  static const textLight = Color(0xFF9CA3AF);
  
  // Gradient colors
  static const gradientPinkStart = Color(0xFFB8487E);
  static const gradientPinkEnd = Color(0xFFE05B7C);
  
  static const gradientBlueStart = Color(0xFF6BA5C1);
  static const gradientBlueEnd = Color(0xFF8EC2D9);
  
  // Chart colors
  static const chartLine1 = Color(0xFF6DB5D4);
  static const chartLine2 = Color(0xFFE8A4B8);
  
  // Status colors
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  
  // Neutral colors
  static const grey100 = Color(0xFFF3F4F6);
  static const grey200 = Color(0xFFE5E7EB);
  static const grey300 = Color(0xFFD1D5DB);
  static const grey400 = Color(0xFF9CA3AF);
}

class AppTextStyles {
  static const displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const displayMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const headlineLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const headlineMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  
  static const titleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static const titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
  
  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
  
  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
  );
  
  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
  );
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

class AppBorderRadius {
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double large = 16.0;
  static const double xl = 24.0;
  static const double circular = 100.0;
}
