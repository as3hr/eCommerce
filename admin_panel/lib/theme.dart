import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/styles/app_colors.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.black,
  onPrimary: AppColors.grayBackground,
  secondary: AppColors.marjanda,
  onSecondary: AppColors.navy,
  surface: AppColors.white,
  onSurface: AppColors.deepBlack,
  onSurfaceVariant: AppColors.offWhite,
  error: AppColors.boldRed,
  onError: Color.fromARGB(255, 237, 233, 233),
  outline: Color.fromARGB(255, 93, 95, 96),
);

final formDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  border: Border.all(
    color: lightColorScheme.primary,
    width: 0.5,
  ),
);

InputDecoration fieldDecoration({
  String? label,
  String? hintText,
  Widget? suffixIcon,
}) =>
    InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: label,
      contentPadding: const EdgeInsets.all(3),
      labelStyle: textFieldTextStyle,
      hintText: hintText,
      errorStyle: const TextStyle(height: 0.001, fontSize: 0.001),
      suffixIcon: suffixIcon,
    );

const listingContainerDecoration = BoxDecoration();
final headingRowDecoration = BoxDecoration(
  color: Colors.grey.withOpacity(0.1),
  borderRadius: BorderRadius.circular(15),
);
final listingTableBorder = TableBorder(
  verticalInside: BorderSide(color: Colors.grey.withOpacity(0.1)),
);
final headingRowColor = WidgetStateColor.resolveWith(
  (states) => Colors.grey[200]!,
);
const listingTableDecoration = BoxDecoration(
  color: AppColors.white,
);
WidgetStateColor listingRowColor(
  int index,
) =>
    WidgetStateColor.resolveWith((states) {
      return index % 2 == 0 ? AppColors.white : AppColors.lightWhite;
    });

final largeTextStyle = GoogleFonts.inter(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: lightColorScheme.onSecondary,
);

final dialogTitleTextStyle = GoogleFonts.inter(
  fontSize: 32,
  fontWeight: FontWeight.w600,
  color: AppColors.smokyBlack,
);

final textFieldTextStyle = GoogleFonts.inter(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: lightColorScheme.primary,
);

final sideBarTextStyle = GoogleFonts.inter(
  fontSize: 22,
  fontWeight: FontWeight.w500,
  color: lightColorScheme.onSecondary,
);

final mediumTextStyle = TextStyle(
  fontFamily: 'SF Pro Display',
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: lightColorScheme.primary,
);

TextStyle backTextStyle = GoogleFonts.inter(
  fontSize: 28,
  fontWeight: FontWeight.w600,
  color: lightColorScheme.onSecondary,
  decoration: TextDecoration.underline,
);
const elevatedButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
final smallTextStyle = GoogleFonts.inter(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: lightColorScheme.primary,
);

final hintTextStyle = GoogleFonts.inter(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: AppColors.grayV,
);
TextTheme textTheme = TextTheme(
  displayLarge: largeTextStyle,
  displayMedium: mediumTextStyle,
  displaySmall: smallTextStyle,
  bodyMedium: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
    color: lightColorScheme.primary,
  ),
  bodySmall: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
    color: lightColorScheme.primary,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'SFPro',
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: lightColorScheme.primary,
  ),
);
ThemeData theme({bool dark = false}) {
  return ThemeData(
    dialogTheme: dialogTheme(),
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: false,
    colorScheme: lightColorScheme,
    fontFamily: 'SFPro',
    elevatedButtonTheme: elevatedButtonTheme(),
    textTheme: textTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardColor:
        dark ? const Color.fromRGBO(34, 34, 34, 1) : lightColorScheme.secondary,
    chipTheme: ChipThemeData(
      selectedColor: AppColors.transparent,
      brightness: dark ? Brightness.dark : Brightness.light,
    ),
    disabledColor: AppColors.grayI,
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.grayI;
          }
          return AppColors.grayBackground;
        },
      ),
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
        (states) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      ),
      minimumSize: WidgetStateProperty.resolveWith<Size>(
        (states) => const Size(180, 40),
      ),
      textStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) => elevatedButtonTextStyle.copyWith(
          color: AppColors.black,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

const checkBoxShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(5),
    topRight: Radius.circular(5),
    bottomLeft: Radius.circular(5),
    bottomRight: Radius.circular(5),
  ),
);

const checkBoxTheme = CheckboxThemeData(
  shape: checkBoxShape,
  side: BorderSide(
    color: AppColors.black,
    width: 1.5,
    strokeAlign: 2,
  ),
);
DialogTheme dialogTheme() {
  return DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 3,
    backgroundColor: Colors.white,
  );
}

TextButtonThemeData textButtonTheme() {
  return const TextButtonThemeData(
    style: ButtonStyle(splashFactory: NoSplash.splashFactory),
  );
}

const inputEnabledBorder = OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.transparent),
);

const inputFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.transparent),
);

const inputErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.boldRed),
);

final boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(2),
  shape: BoxShape.rectangle,
  border: Border.all(
    color: AppColors.black,
    width: 1,
  ),
);
