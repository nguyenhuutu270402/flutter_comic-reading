import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  static const lightMode = CustomThemeExtension(
    blackOrWhite: AppColors.black,
    whiteOrBlack: AppColors.white,
    blueColor: AppColors.blueLight,
    langBtnBgColor: Color(0XFFF7F8FA),
    langBtnHighLightBgColor: Color(0XFFE8E8ED),
    greyBackground: Color(0XFF202C33),
    authAppbarTextColor: Color(0XFF008069),
    backgroundColorBottomSheet: Colors.white,
  );
  static const darkMode = CustomThemeExtension(
    blackOrWhite: AppColors.white,
    whiteOrBlack: AppColors.black,
    blueColor: AppColors.blueDark,
    langBtnBgColor: Color(0XFF182229),
    langBtnHighLightBgColor: Color(0XFF09141A),
    greyBackground: Color.fromARGB(255, 71, 93, 105),
    authAppbarTextColor: Colors.white,
    backgroundColorBottomSheet: Color(0XFF424242),
  );
  final Color? blackOrWhite;
  final Color? whiteOrBlack;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighLightBgColor;
  final Color? greyBackground;
  final Color? authAppbarTextColor;
  final Color? backgroundColorBottomSheet;

  const CustomThemeExtension({
    this.blackOrWhite,
    this.whiteOrBlack,
    this.blueColor,
    this.langBtnBgColor,
    this.langBtnHighLightBgColor,
    this.greyBackground,
    this.authAppbarTextColor,
    this.backgroundColorBottomSheet,
  });

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? blackOrWhite,
    Color? whiteOrBlack,
    Color? blueColor,
    Color? langBtnBgColor,
    Color? langBtnHighLightBgColor,
    Color? greyBackground,
    Color? authAppbarTextColor,
    Color? backgroundColorBottomSheet,
  }) {
    return CustomThemeExtension(
      blackOrWhite: blackOrWhite ?? this.blackOrWhite,
      whiteOrBlack: whiteOrBlack ?? this.whiteOrBlack,
      blueColor: blueColor ?? this.blueColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighLightBgColor:
          langBtnHighLightBgColor ?? this.langBtnHighLightBgColor,
      greyBackground: greyBackground ?? this.greyBackground,
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
      backgroundColorBottomSheet:
          backgroundColorBottomSheet ?? this.backgroundColorBottomSheet,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      blackOrWhite: Color.lerp(blackOrWhite, other.blackOrWhite, t),
      whiteOrBlack: Color.lerp(whiteOrBlack, other.whiteOrBlack, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
      langBtnHighLightBgColor:
          Color.lerp(langBtnHighLightBgColor, other.langBtnHighLightBgColor, t),
      greyBackground: Color.lerp(greyBackground, other.greyBackground, t),
      authAppbarTextColor:
          Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      backgroundColorBottomSheet: Color.lerp(
          backgroundColorBottomSheet, other.backgroundColorBottomSheet, t),
    );
  }
}
