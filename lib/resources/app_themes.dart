import 'package:flutter/material.dart';
import 'package:superapp/resources/app_colors.dart';
import 'package:superapp/resources/app_fonts.dart';
import 'package:superapp/resources/app_sizes.dart';
import 'package:superapp/resources/app_styles.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.error,
    disabledColor: AppColors.disabled,
    splashColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    cardTheme: CardTheme(
      color: AppColors.white,
      shadowColor: AppColors.disabled,
      elevation: AppSizes.s10,
    ),
    dividerColor: AppColors.border100,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.white,
      elevation: 0,
      shadowColor: AppColors.disabled,
      titleTextStyle: getTitleStyle(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      elevation: AppSizes.s2,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: AppColors.secondary,
      unselectedItemColor: AppColors.body,
      selectedLabelStyle: getHelperStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: getHelperStyle(),
      selectedIconTheme: IconThemeData(
        color: AppColors.secondary,
        size: AppSizes.s10,
      ),
      unselectedIconTheme:
          IconThemeData(color: AppColors.body, size: AppSizes.s3),
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: AppColors.disabled,
      buttonColor: AppColors.primary,
      splashColor: AppColors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        textStyle: getTitleStyle(color: AppColors.white),
        padding: EdgeInsets.all(AppSizes.s2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s0),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.body,
        elevation: 0,
        textStyle: getTitleStyle(),
        side: BorderSide(color: AppColors.border),
        padding: EdgeInsets.all(AppSizes.s10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s2),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: getSubtitleStyle(),
      bodyMedium: getRegularStyle(),
      bodySmall: getHelperStyle(),
      titleMedium: getTitleStyle(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: false,
      filled: true,
      fillColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.s2,
        vertical: 10,
      ),
      helperStyle: getRegularStyle(),
      hintStyle: getRegularStyle(),
      labelStyle: getLabelStyle(),
      // floatingLabelStyle: getLabelStyle(),
      prefixIconColor: AppColors.body,
      suffixIconColor: getIconStyle(),
      errorStyle: getErrorStyle(),
      border: getBorderFormStyle(),
      focusedBorder: getBorderFormStyle(color: AppColors.primary),
      errorBorder: getBorderFormStyle(color: AppColors.error),
      focusedErrorBorder: getBorderFormStyle(color: AppColors.error),
    ),
    datePickerTheme: DatePickerThemeData(
      dividerColor: AppColors.border,
      backgroundColor: AppColors.white,
      todayBorder: BorderSide(color: AppColors.primary),
      headerHeadlineStyle: TextStyle(
        fontSize: AppFontSizes.h2,
        fontWeight: AppFontWeights.medium,
      ),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }

        return AppColors.white;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.s1),
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColors.primary,
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColors.primary,
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }

        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }

        return null;
      }),
    ),
    sliderTheme: SliderThemeData(
      thumbColor: AppColors.primary,
    ),
  );
}
