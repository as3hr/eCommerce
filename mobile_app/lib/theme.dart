import 'helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  primary: AppColors.pureWhite,
  secondary: AppColors.lightPurple,
  onPrimary: AppColors.grayI,
  onSecondary: AppColors.pureBlack,
  surface: AppColors.pureWhite,
  onSurface: AppColors.grayI,
  error: AppColors.redColor,
  onError: Color.fromARGB(255, 237, 233, 233),
  brightness: Brightness.light,
);

const darkColorScheme = ColorScheme(
  primary: AppColors.indigo,
  secondary: AppColors.lightPurple,
  onPrimary: AppColors.lightIndigo,
  onSecondary: AppColors.pureWhite,
  surface: AppColors.indigo,
  onSurface: AppColors.lightIndigo,
  error: AppColors.redColor,
  onError: AppColors.grayI,
  brightness: Brightness.dark,
);

ThemeData theme({bool dark = false}) {
  return ThemeData(
    scaffoldBackgroundColor: dark ? AppColors.indigo : AppColors.pureWhite,
    useMaterial3: true,
    colorScheme: dark ? darkColorScheme : lightColorScheme,
    fontFamily: 'SFPro',
    textTheme: dark ? Typography.whiteCupertino : Typography.blackCupertino,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
