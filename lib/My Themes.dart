import 'package:flutter/material.dart';

class MyThemes{

  static final Color primaryColor = Color(0xFFB7935F);
  static final Color primaryDark = Color(0xFFFACC1D);
  static final Color darkblue = Color(0xFF141A2E);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        iconTheme: IconThemeData(
        color: Colors.black
    )
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18, color: Colors.black),
        headline4: TextStyle(fontSize: 28, color: Colors.black),
        headline5: TextStyle(fontSize: 24, color: Colors.black)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
          color: Colors.black
      ),
      unselectedIconTheme: IconThemeData(
          color: Colors.white
      ),
      selectedLabelStyle: TextStyle(
          color: Colors.black
      ),
      selectedItemColor: Color(0xFFB7935F),
      unselectedItemColor: Colors.white,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: darkblue,

    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        iconTheme: IconThemeData(
            color: primaryDark
        )
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18, color: primaryDark ),
        headline4: TextStyle(fontSize: 28, color: primaryDark),
        headline5: TextStyle(fontSize: 24, color: primaryDark)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkblue,
      selectedIconTheme: IconThemeData(
          color: primaryDark
      ),
      unselectedIconTheme: IconThemeData(
          color: Colors.white
      ),
      selectedLabelStyle: TextStyle(
          color: primaryDark
      ),
      selectedItemColor: primaryDark,
      unselectedItemColor: Colors.white,
    ),
  );

}