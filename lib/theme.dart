import 'helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  primary: AppColors.pureWhite,
  secondary: AppColors.lightPurple,
  surface: AppColors.grayI,
  background: AppColors.pureWhite,
  error: AppColors.redColor,
  onPrimary: AppColors.grayI,
  onSecondary: AppColors.pureBlack,
  onSurface: AppColors.pureBlack,
  onBackground: AppColors.grayI,
  onError: Color.fromARGB(255, 237, 233, 233),
  brightness: Brightness.light,
);

const darkColorScheme = ColorScheme(
  primary: AppColors.indigo,
  secondary: AppColors.pureWhite,
  surface: AppColors.grayIV,
  background: AppColors.indigo,
  error: AppColors.redColor,
  onPrimary: AppColors.lightIndigo,
  onSecondary: AppColors.grayI,
  onSurface: AppColors.pureWhite,
  onBackground: AppColors.lightIndigo,
  onError: AppColors.grayI,
  brightness: Brightness.dark,
);
ThemeData theme({bool dark = false}) {
  return ThemeData(
    scaffoldBackgroundColor: dark ? AppColors.indigo : AppColors.pureWhite,
    useMaterial3: false,
    colorScheme: dark ? darkColorScheme : lightColorScheme,
    fontFamily: 'SFPro',
    textTheme: dark ? Typography.whiteCupertino : Typography.blackCupertino,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardColor:
        dark ? const Color.fromRGBO(34, 34, 34, 1) : lightColorScheme.surface,
    disabledColor: AppColors.grayI,
  );
}
