import 'package:comic_reading/common/extension/change_theme_model.dart';
import 'package:comic_reading/common/theme/dark_theme.dart';
import 'package:comic_reading/common/theme/light_theme.dart';
import 'package:comic_reading/bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return ChangeThemeModel();
      },
      child: MyApp(),
    ),
  );
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
  // static const isDarkTheme = true;
  static const isDarkTheme = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic Reading',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: Provider.of<ChangeThemeModel>(context).isDarkMode == false
          ? ThemeMode.light
          : ThemeMode.dark,
      home: BottomNav(),
      builder: EasyLoading.init(),
    );
  }
}

    // final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
    