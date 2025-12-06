import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'text_styles.dart';


class AppTheme {
static ThemeData lightTheme = ThemeData(
brightness: Brightness.light,
scaffoldBackgroundColor: AppColors.white,
primaryColor: AppColors.black,


textTheme: const TextTheme(
displayLarge: AppTextStyles.heading1,
displayMedium: AppTextStyles.heading2,
bodyLarge: AppTextStyles.body,
bodyMedium: AppTextStyles.bodyGrey,
bodySmall: AppTextStyles.caption,
),


elevatedButtonTheme: ElevatedButtonThemeData(
style: ElevatedButton.styleFrom(
backgroundColor: (AppColors.black),
foregroundColor: (AppColors.white),
padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10),
),
),
),
);
}