import 'package:flashcard/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
    primaryColor: kRed,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: GoogleFonts.notoSans().fontFamily),
    ),
    appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.notoSans().fontFamily,
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        color: kRed),
    scaffoldBackgroundColor: kYellow);
