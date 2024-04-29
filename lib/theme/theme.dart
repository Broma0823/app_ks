import 'package:app/theme/appbar.dart';
import 'package:app/theme/bottomsheet.dart';
import 'package:app/theme/card.dart';
import 'package:app/theme/checkbox.dart';
import 'package:app/theme/chip.dart';
import 'package:app/theme/elevatedbutton.dart';
import 'package:app/theme/icon.dart';
import 'package:app/theme/text.dart';
import 'package:app/theme/textfield_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // dialogBackgroundColor: Colors.black,

  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  primaryColor: Colors.black,

  scaffoldBackgroundColor: Colors.white,
  splashColor: Colors.grey.shade200,

  //text
  textTheme: TTextTheme.lightTextTheme,
  //elevated buttom
  elevatedButtonTheme: TElevetedButtomTheme.lightElevatedButtomTheme,
  //appbar
  appBarTheme: TAppBarTheme.lightAppBarTheme,
  //bottomsheet
  bottomSheetTheme: TBottomSheetTheme.lightBottomSheetThemeData,
  //checkbox
  checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
  //chip
  chipTheme: TChipTheme.lightChipTheme,
  //textfield
  inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
  //outlinedbutton
  cardTheme: TCardTheme.lightCardTheme,
  iconTheme: TIconTheme.lightIconTheme,
);
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: const Color(0xff1b1d23),
  splashColor: const Color(0xff262931),

  //text
  textTheme: TTextTheme.darkTextTheme,
  //elevated buttom
  elevatedButtonTheme: TElevetedButtomTheme.darkElevatedButtomTheme,
  //appbar
  appBarTheme: TAppBarTheme.darkAppBarTheme,
  //bottomsheet
  bottomSheetTheme: TBottomSheetTheme.darkBottomSheetThemeData,
  //checkbox
  checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
  //chip
  chipTheme: TChipTheme.darkChipTheme,
  //textfield
  inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,

  cardTheme: TCardTheme.darkCardTheme,
  iconTheme: TIconTheme.darkIconTheme,
);
