import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_movies/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: defaultColor,
        backgroundColor: Colors.green),
    elevation: 0,
    color: Colors.white,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  backgroundColor: Colors.grey.shade700,
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.grey.shade700,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey.shade700,
      statusBarColor: Colors.grey.shade700,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  ),
);
