import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class ChiTietPage extends StatefulWidget {
  const ChiTietPage({super.key, required this.id});
  final int id;
  @override
  State<ChiTietPage> createState() => _ChiTietPageState();
}

class _ChiTietPageState extends State<ChiTietPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
          Positioned(
            child: Container(
              width: screenWidth,
              height: 50,
              decoration: BoxDecoration(
                color: myColors.whiteOrBlack,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(
                        0, 2), // Tạo đổ bóng chỉ ở phần bottom của Container
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'ID truyện ${widget.id}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
