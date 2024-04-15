import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_trackify/styles/colors.dart';

ThemeData customTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: seedColor,
    primary: primaryColor,
  ),
  useMaterial3: true,
  textTheme: TextTheme(
    displaySmall: GoogleFonts.getFont(
      'Open Sans',
      fontSize: 14,
      color: darkGreyColor,
      fontWeight: FontWeight.w400,
    ),

    /// Login button
    displayMedium: GoogleFonts.getFont(
      'Open Sans',
      fontSize: 20,
      color: whiteColor,
      fontWeight: FontWeight.bold,
    ),

    /// Application name
    displayLarge: GoogleFonts.getFont(
      'Open Sans',
      fontSize: 30,
      color: primaryColor,
      fontWeight: FontWeight.bold,
    ),

    titleSmall: GoogleFonts.getFont(
      'Lato',
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),

    titleMedium: GoogleFonts.getFont(
      'Lato',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1.1,
    ),

    headlineSmall: GoogleFonts.getFont(
      'Lato',
      fontSize: 12,
      color: lightGreyColor,
    ),

    headlineMedium: GoogleFonts.getFont(
      'Lato',
      fontSize: 14,
      color: darkGreyColor,
      fontWeight: FontWeight.bold,
    ),

    headlineLarge: GoogleFonts.getFont(
      'Lato',
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),

    labelSmall: GoogleFonts.getFont(
      'Lato',
      fontSize: 14,
      color: lightGreyColor,
    ),

    labelMedium: GoogleFonts.getFont(
      'Roboto',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: lightGreyColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: seedColor,
    foregroundColor: whiteColor,
    centerTitle: true,
    titleTextStyle: GoogleFonts.getFont(
      'Lato',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
