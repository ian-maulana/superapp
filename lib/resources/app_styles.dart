import 'package:flutter/material.dart';
import 'package:superapp/core/base/inner_outlined_input_border/index.dart';
import 'package:superapp/resources/app_colors.dart';
import 'package:superapp/resources/app_fonts.dart';
import 'package:superapp/resources/app_radius.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle getErrorStyle() {
  return _getTextStyle(
    AppFontSizes.sm,
    AppFontFamilies.primary,
    AppFontWeights.regular,
    AppColors.error,
  );
}

TextStyle getRegularStyle({Color? color}) {
  return _getTextStyle(
    AppFontSizes.md,
    AppFontFamilies.primary,
    AppFontWeights.regular,
    color ?? AppColors.body,
  );
}

TextStyle getTitleStyle({Color? color}) {
  return _getTextStyle(
    AppFontSizes.lg,
    AppFontFamilies.primary,
    AppFontWeights.medium,
    color ?? AppColors.body,
  );
}

TextStyle getSubtitleStyle({Color? color}) {
  return _getTextStyle(
    AppFontSizes.md,
    AppFontFamilies.primary,
    AppFontWeights.medium,
    color ?? AppColors.body,
  );
}

TextStyle getHelperStyle({Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
    AppFontSizes.sm,
    AppFontFamilies.primary,
    fontWeight ?? AppFontWeights.regular,
    color ?? AppColors.body,
  );
}

TextStyle getLabelStyle() {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.focused)) {
      TextStyle(color: AppColors.primary);
    }

    return TextStyle(color: AppColors.border);
  });
}

Color getIconStyle() {
  return WidgetStateColor.resolveWith((states) {
    if (states.contains(WidgetState.error)) {
      return AppColors.error;
    } else if (states.contains(WidgetState.focused)) {
      return AppColors.primary;
    }

    return AppColors.border;
  });
}

TextStyle getFocusLabelStyle() {
  return _getTextStyle(
    AppFontSizes.md,
    AppFontFamilies.primary,
    AppFontWeights.medium,
    AppColors.primary,
  );
}

InputBorder getBorderFormStyle({Color? color}) {
  return InnerOutlinedInputBorder(
    borderRadius: BorderRadius.circular(AppRadius.s2_2),
    borderSide: BorderSide(
      color: color ?? AppColors.border,
      width: 1.5,
    ),
  );
}
