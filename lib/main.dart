import 'dart:ui';
import 'package:episode_1/screens/LandingScreen.dart';
import 'package:episode_1/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Episode 1",
      theme: ThemeData(
        primaryColor: COLOR_WHITE,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: COLOR_DARK_BLUE),
        textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
        fontFamily: "Montserrat",
      ),
      home: LandingScreen(),
    );
  }
}
