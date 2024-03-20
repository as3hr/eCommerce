import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'helpers/extensions/theme_colors.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: ThemeColors.black,
  onPrimary: ThemeColors.grayBackground,
  secondary: ThemeColors.marjanda,
  onSecondary: ThemeColors.navy,
  background: ThemeColors.white,
  onBackground: ThemeColors.grayBackground,
  surface: ThemeColors.white,
  onSurface: ThemeColors.deepBlack,
  onSurfaceVariant: ThemeColors.offWhite,
  error: ThemeColors.boldRed,
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
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.blue),
        borderRadius: BorderRadius.circular(2),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 0.75),
        borderRadius: BorderRadius.circular(2),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: label,
      contentPadding: const EdgeInsets.only(left: 10),
      labelStyle: textFieldTextStyle,
      hintText: hintText,
      errorStyle: const TextStyle(height: 0.001, fontSize: 0.001),
      suffixIcon: suffixIcon,
    );

const listingContainerDecoration = BoxDecoration();
const headingRowDecoration = BoxDecoration(
  border: Border(
    bottom: BorderSide(color: ThemeColors.black, width: 2),
    top: BorderSide(
      color: ThemeColors.transparent,
    ),
    left: BorderSide(
      color: ThemeColors.transparent,
    ),
    right: BorderSide(
      color: ThemeColors.transparent,
    ),
  ),
);
const listingTableBorder = TableBorder(
  verticalInside: BorderSide(color: ThemeColors.grayII),
);
final headingRowColor = MaterialStateColor.resolveWith(
  (states) => ThemeColors.white,
);
const listingTableDecoration = BoxDecoration(
  color: ThemeColors.white,
);
MaterialStateColor listingRowColor(
  int index,
) =>
    MaterialStateColor.resolveWith((states) {
      return index % 2 == 0 ? ThemeColors.white : ThemeColors.grayBackground;
    });

final largeTextStyle = GoogleFonts.inter(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: lightColorScheme.onSecondary,
);

final dialogTitleTextStyle = GoogleFonts.inter(
  fontSize: 32,
  fontWeight: FontWeight.w600,
  color: ThemeColors.smokyBlack,
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
  color: ThemeColors.grayV,
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
    scaffoldBackgroundColor: ThemeColors.platinumWhiteI,
    useMaterial3: false,
    colorScheme: lightColorScheme,
    fontFamily: 'SFPro',
    elevatedButtonTheme: elevatedButtonTheme(),
    textTheme: textTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardColor:
        dark ? const Color.fromRGBO(34, 34, 34, 1) : lightColorScheme.secondary,
    chipTheme: ChipThemeData(
      selectedColor: ThemeColors.transparent,
      brightness: dark ? Brightness.dark : Brightness.light,
    ),
    disabledColor: ThemeColors.grayI,
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return ThemeColors.grayI;
          }
          return ThemeColors.grayBackground;
        },
      ),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) =>
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      ),
      minimumSize: MaterialStateProperty.resolveWith<Size>(
        (states) => const Size(180, 40),
      ),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (states) => elevatedButtonTextStyle.copyWith(
          color: ThemeColors.black,
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
    color: ThemeColors.black,
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
  borderSide: BorderSide(color: ThemeColors.transparent),
);

const inputFocusedBorder = OutlineInputBorder(
  borderSide: BorderSide(color: ThemeColors.transparent),
);

const inputErrorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: ThemeColors.boldRed),
);

final boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(2),
  shape: BoxShape.rectangle,
  border: Border.all(
    color: ThemeColors.black,
    width: 1,
  ),
);
