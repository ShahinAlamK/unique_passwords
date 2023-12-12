import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniqe_passwords/utils/constants/colors.dart';

class CustomText{

  static TextTheme lightText = TextTheme(
    headlineLarge:GoogleFonts.poppins(fontSize: 35,color: PColor.textDarkColor,fontWeight: FontWeight.bold),
    headlineMedium:GoogleFonts.poppins(fontSize: 22,color: PColor.textDarkColor,fontWeight: FontWeight.normal),
    headlineSmall:GoogleFonts.poppins(fontSize: 18,color: PColor.textDarkColor,fontWeight: FontWeight.w300),

    titleLarge: GoogleFonts.poppins(fontSize: 18,color: PColor.textDarkColor,fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.poppins(fontSize: 16,color: PColor.textDarkColor,fontWeight: FontWeight.normal),
    titleSmall: GoogleFonts.poppins(fontSize: 14,color: PColor.textDarkColor,fontWeight: FontWeight.w300),

    bodyLarge: GoogleFonts.poppins(fontSize: 18,color: PColor.textDarkColor,fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.poppins(fontSize: 16,color: PColor.textDarkColor,fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.poppins(fontSize: 14,color: PColor.textDarkColor,fontWeight: FontWeight.w300),
  );
}