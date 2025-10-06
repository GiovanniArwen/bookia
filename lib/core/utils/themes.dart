import 'package:bookia/core/constants/appfonts.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.primaryColor,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyles.size26(
        color:AppColors.darkColor,
        fontSize: 24,
      ).copyWith(fontFamily: Appfonts.dM)
    ),
    
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.whiteColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      headerForegroundColor: AppColors.primaryColor,
    ),
    timePickerTheme: TimePickerThemeData(
      dayPeriodColor: AppColors.primaryColor,
    ),
    fontFamily: Appfonts.dM,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.accentColor,
      hintStyle: TextStyles.size16(color: AppColors.greyColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
