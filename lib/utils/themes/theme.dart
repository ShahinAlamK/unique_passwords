import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uniqe_passwords/utils/constants/colors.dart';
import 'package:uniqe_passwords/utils/themes/custom_theme/custom_text.dart';

class PTheme{

  static ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: PColor.secondaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: PColor.primaryColor,
      titleTextStyle: GoogleFonts.poppins(fontSize: 18,color: PColor.textLightColor,fontWeight: FontWeight.normal),
    ),
    switchTheme:SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(PColor.primaryColor),
      trackOutlineColor: MaterialStatePropertyAll(PColor.primaryColor),
      trackColor: const MaterialStatePropertyAll(Colors.white),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashRadius: 5
    ),

    textTheme: CustomText.lightText,
      colorScheme: ColorScheme.light(
      brightness: Brightness.light,
        primary: Colors.deepPurple.shade900,
        onPrimary: Colors.white
  )
  );
}