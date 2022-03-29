import 'package:flutter/material.dart';

class AppColors {
  Color backgroundSuccess = const Color(0xffD0E1C1);
  Color backgroundCard = const Color(0xffEAEAEA);
  Color textSuccess = const Color(0xff2E7D32);
  Color textOnDelivery = const Color(0xffD84315);
  Color textCancelled = const Color(0xffC50E29);

  Color textDark = const Color(0xFF303134);
  Color textLight = const Color(0xffFFFFFF);
  // Color pallete
  Color primaryColor = const Color(0xFF2C2A4A);
  Color secondaryColor = const Color(0xFFD7103C);

  Color tertiaryColor = const Color(0xFF5C3D31);
  Color darkPrimaryColor = const Color(0xE6000000);
  Color darkSecondaryColor = const Color(0xFFB7B7B7);
  Color lightColor = const Color(0xFFFFFFFF);

  Color successPrimaryColor = const Color(0xFF40BB40);
  Color successSecondaryColor = const Color(0xFF7cdc7c);
  Color errorPrimaryColor = const Color(0xFFD63636);
  Color errorSecondaryColor = const Color(0xFFDC7D7D);
  //Colors components
  //Bottom navigation
  late Color unselectedColor;
  late Color selectedColor;
  late Color bottomNavigatonColor;
  //AppBar Colors
  late Color appBarColor;
  late Color appBarColorAuth;
  late Color appBarColorHome;
  late Color iconAppBarColors;

  late Color darkPrimaryWithOpacity;

  //Scaffold
  late Color scaffoldBackgroundColorPrimary;

  AppColors({
    Color? scaffoldBackgroundColorPrimary,
    Color? bottomNavigatonColor,
    Color? appBarColor,
    Color? appBarColorAuth,
    Color? unselectedColor,
    Color? selectedColor,
    Color? backGroundBottomNavigationColor,
    Color? appBarColorHome,
    Color? iconAppBarColors,
  }) {
    this.scaffoldBackgroundColorPrimary =
        scaffoldBackgroundColorPrimary ?? lightColor;
    // appBar colors
    this.appBarColor = appBarColor ?? primaryColor;
    this.appBarColorAuth = appBarColorAuth ?? Colors.transparent;
    this.appBarColorHome = appBarColorHome ?? secondaryColor;
    this.iconAppBarColors = iconAppBarColors ?? darkPrimaryColor;
    //bottom navigation colors
    this.unselectedColor = unselectedColor ?? primaryColor.withOpacity(0.8);
    this.selectedColor = selectedColor ?? primaryColor;
    this.bottomNavigatonColor = bottomNavigatonColor ?? secondaryColor;

    this.darkPrimaryWithOpacity = darkPrimaryColor.withOpacity(0.6);
  }
}
