import 'package:comic_reading/common/theme/dark_theme.dart';
import 'package:comic_reading/common/theme/light_theme.dart';
import 'package:comic_reading/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const isDarkTheme = true;
  // static const isDarkTheme = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic Reading',
      theme: isDarkTheme == false ? lightTheme() : darkTheme(),
      // darkTheme: isDarkTheme == true ? lightTheme() : darkTheme(),
      themeMode: ThemeMode.system,
      home: BottomNav(),
      builder: EasyLoading.init(),
    );
  }
}

    // final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
    