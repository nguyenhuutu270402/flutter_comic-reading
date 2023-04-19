import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class HeaderBarWidget extends StatelessWidget {
  const HeaderBarWidget({
    super.key,
    required this.screenWidth,
    required this.myColors,
    required this.title,
    this.iconButtonRight,
    this.iconButtonLeft,
  });

  final double screenWidth;
  final CustomThemeExtension myColors;
  final String title;
  final IconButton? iconButtonRight;
  final IconButton? iconButtonLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 50,
      decoration: BoxDecoration(
        color: myColors.whiteOrBlack,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 0.1,
            offset: Offset(0, 1), // Tạo đổ bóng chỉ ở phần bottom của Container
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            child: iconButtonLeft ?? null,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Container(
            width: 50,
            child: iconButtonRight ?? null,
          ),
        ],
      ),
    );
  }
}
