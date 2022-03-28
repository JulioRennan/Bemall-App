import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static AppColors appColors = AppColors();
  String fontFamilyDefault = "Montserrat";
  late ThemeData defaultTheme;
  static List<BoxShadow> defaultShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(.25),
      spreadRadius: 0,
      blurRadius: 4,
      offset: Offset(0, 4), // changes position of shadow
    ),
  ];
  AppTheme() {
    defaultTheme = ThemeData(
      indicatorColor: appColors.primaryColor,
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: appColors.primaryColor),
      fontFamily: this.fontFamilyDefault,
      errorColor: appColors.errorPrimaryColor,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: appColors.primaryColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: appColors.primaryColor,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: appColors.errorPrimaryColor,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: appColors.errorPrimaryColor,
          ),
        ),
        contentPadding: EdgeInsets.zero,
        hintStyle: TextStyle(
          fontFamily: fontFamilyDefault,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.italic,
          color: appColors.darkSecondaryColor,
        ),
        labelStyle: TextStyle(
          fontFamily: fontFamilyDefault,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: appColors.darkSecondaryColor,
        ),
        counterStyle: TextStyle(
          color: Colors.transparent,
        ),
      ),
      buttonTheme: ButtonThemeData(
        splashColor: Colors.black45,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: fontFamilyDefault,
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: appColors.darkSecondaryColor,
        ),
        headline2: TextStyle(
          fontFamily: fontFamilyDefault,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: appColors.darkSecondaryColor,
        ),
        headline3: TextStyle(
          fontFamily: fontFamilyDefault,
          fontSize: 18,
          color: appColors.darkSecondaryColor,
        ),
        headline4: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: appColors.darkSecondaryColor,
        ),
        headline5: TextStyle(
          fontFamily: fontFamilyDefault,
          color: appColors.darkSecondaryColor,
          fontSize: 16,
        ),
        headline6: TextStyle(
            fontFamily: fontFamilyDefault,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: appColors.darkPrimaryColor),
        bodyText1: TextStyle(
          fontFamily: fontFamilyDefault,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: appColors.primaryColor,
        ),
        bodyText2: TextStyle(
          fontFamily: fontFamilyDefault,
          fontSize: 14,
          color: appColors.darkSecondaryColor,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          fontFamily: fontFamilyDefault,
          color: appColors.darkSecondaryColor,
          fontSize: 22,
        ),
        subtitle2: TextStyle(
          fontFamily: fontFamilyDefault,
          color: appColors.darkSecondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColors.bottomNavigatonColor,
        showUnselectedLabels: true,
      ),
      primaryColor: appColors.primaryColor,
      scaffoldBackgroundColor: appColors.scaffoldBackgroundColorPrimary,
      backgroundColor: appColors.scaffoldBackgroundColorPrimary,
      primaryColorLight: appColors.lightColor,
      appBarTheme: AppBarTheme(color: appColors.appBarColor),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((getColorCheckBox)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      iconTheme: IconThemeData(
        color: appColors.primaryColor,
      ),
      colorScheme: ColorScheme.light()
          .copyWith(primary: appColors.primaryColor)
          .copyWith(secondary: appColors.primaryColor),
    );
  }
  Color getColorCheckBox(Set<MaterialState> states) {
    return AppTheme.appColors.primaryColor;
  }
}
