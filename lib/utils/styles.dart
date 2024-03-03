import 'package:chatai/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
Main styles of the app are defined in that class
*/

class Styles {
  // basic colors
  static Color greyColor = const Color(0xFFD2D1D1);
  static Color lightGrey = const Color(0xFFEDEDED);
  static Color textGrey = const Color(0xFFACAAAA);
  static Color dissabled = const Color(0xFFE7E7E7);

  // app basic styles
  static TextStyle normalText = GoogleFonts.fredoka(
    fontSize: Layout.getHeight(12),
  );

  static TextStyle header = GoogleFonts.fredoka(
    fontSize: Layout.getHeight(25),
    fontWeight: FontWeight.w700,
  );

  static TextStyle headerMain = GoogleFonts.fredoka(
    fontSize: Layout.getHeight(15),
    fontWeight: FontWeight.w600,
  );

  static TextStyle fainted = GoogleFonts.fredoka(
    fontSize: Layout.getHeight(12),
    fontWeight: FontWeight.w100,
    color: Styles.greyColor,
  );
}
