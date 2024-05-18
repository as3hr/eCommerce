import 'helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  background: AppColors.pureWhite,
  primary: AppColors.pureWhite,
  secondary: AppColors.lightPurple,
  onPrimary: AppColors.grayI,
  onSecondary: AppColors.pureBlack,
  surface: AppColors.grayI,
  onSurface: AppColors.pureBlack,
  error: AppColors.redColor,
  onBackground: AppColors.grayI,
  onError: Color.fromARGB(255, 237, 233, 233),
  brightness: Brightness.light,
);

const darkColorScheme = ColorScheme(
  background: AppColors.indigo,
  primary: AppColors.indigo,
  secondary: AppColors.lightPurple,
  onPrimary: AppColors.lightIndigo,
  onSecondary: AppColors.pureWhite,
  surface: AppColors.grayIV,
  onSurface: AppColors.pureWhite,
  error: AppColors.redColor,
  onBackground: AppColors.lightIndigo,
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
