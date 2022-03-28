import 'package:flutter/material.dart';

class AppColors {
  Color backgroundSuccess = Color(0xffD0E1C1);
  Color backgroundCard = Color(0xffEAEAEA);
  Color textSuccess = Color(0xff2E7D32);
  Color textOnDelivery = Color(0xffD84315);
  Color textCancelled = Color(0xffC50E29);

  Color textDark = Color(0xFF303134);
  Color textLight = Color(0xffFFFFFF);
  // Color pallete
  Color primaryColor = Color(0xFF2C2A4A);
  Color secondaryColor = Color(0xFFD7103C);

  Color tertiaryColor = Color(0xFF5C3D31);
  Color darkPrimaryColor = Color(0xE6000000);
  Color darkSecondaryColor = Color(0xFFB7B7B7);
  Color lightColor = Color(0xFFFFFFFF);

  Color successPrimaryColor = Color(0xFF40BB40);
  Color successSecondaryColor = Color(0xFF7cdc7c);
  Color errorPrimaryColor = Color(0xFFD63636);
  Color errorSecondaryColor = Color(0xFFDC7D7D);
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
