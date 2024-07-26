import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_mockup_generator/Utils/Theme/customTheme/appBArTheme.dart';
import 'package:mobile_mockup_generator/Utils/Theme/customTheme/bottomSheet.dart';
import 'package:mobile_mockup_generator/Utils/Theme/customTheme/checkboxTheme.dart';
import 'package:mobile_mockup_generator/Utils/Theme/customTheme/chipThemeData.dart';
import 'package:mobile_mockup_generator/Utils/Theme/customTheme/elevated_buttonTheme.dart';
import 'package:mobile_mockup_generator/Utils/Theme/customTheme/textFieldTheme.dart';
import 'package:mobile_mockup_generator/Utils/Theme/customTheme/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.outfit().fontFamily,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.lighttheme, //// text color change
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.light,
      checkboxTheme: TCheckBoxTheme.light,
      chipTheme: TChipTheme.light,
      inputDecorationTheme: TTextfieldTheme.light,

      /// textformfield color change
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'popins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.darkTheme,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: TAppBarTheme.blackAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.Dark,
      checkboxTheme: TCheckBoxTheme.Dark,
      chipTheme: TChipTheme.Dark,
      inputDecorationTheme: TTextfieldTheme.dark,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButton);
}
