import 'package:comic_reading/common/theme/dark_theme.dart';
import 'package:comic_reading/common/theme/light_theme.dart';
import 'package:comic_reading/screens/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // static const isDarkTheme = true;
  static const isDarkTheme = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set status bar color to red

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic Reading',
      theme: isDarkTheme == false ? lightTheme() : darkTheme(),
      // darkTheme: a == false ? lightTheme() : darkTheme(),
      themeMode: ThemeMode.system,
      home: BottomNav(),
    );
  }
}
