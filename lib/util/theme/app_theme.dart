
import 'package:flutter/material.dart';
import 'package:flutter_test_2/util/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getLightModeTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColors.scaffold,
      secondaryHeaderColor: LightColors.secondColorLight,
      primaryColor: LightColors.primaryColorLight,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: LightColors.textColor),
        displayMedium: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: LightColors.textColor),
        displaySmall: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 8,
            color: LightColors.textColor),
        bodyLarge: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: LightColors.textColor),
        bodyMedium: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: LightColors.textColor),
        bodySmall: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: LightColors.textColor),
        labelLarge: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: LightColors.secondColorLight),
        labelMedium: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: LightColors.secondColorLight),
        labelSmall: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: LightColors.secondColorLight),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: LightColors.secondColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(LightColors.primaryColorLight),
      )),
      colorScheme: ColorScheme.fromSeed(
          primary: LightColors.primaryColorLight,
          shadow: colorShadow,
          seedColor: LightColors.primaryColorLight),
      useMaterial3: true,
    );
  }

  static ThemeData getDarkModeTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkColours.scaffold,
      primaryColor: DarkColours.primaryColor,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: DarkColours.textColor),
        displayMedium: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: DarkColours.textColor),
        displaySmall: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 8,
            color: DarkColours.textColor),
        bodyLarge: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: DarkColours.textColor),
        bodyMedium: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: DarkColours.textColor),
        bodySmall: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: DarkColours.textColor),
        labelLarge: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: DarkColours.secondColor),
        labelMedium: GoogleFonts.lato(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: DarkColours.secondColor),
        labelSmall: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 8,
            color: DarkColours.secondColor),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}
