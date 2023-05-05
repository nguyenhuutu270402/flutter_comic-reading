import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/button_login_widget.dart';
import 'package:comic_reading/common/widgets/text_change_screen_login_widget.dart';
import 'package:comic_reading/common/widgets/text_field_login_widget.dart';
import 'package:comic_reading/screens/dang_ky/dang_ky_page.dart';
import 'package:flutter/material.dart';

class DangNhapPage extends StatefulWidget {
  const DangNhapPage({super.key});

  @override
  State<DangNhapPage> createState() => _DangNhapPageState();
}

class _DangNhapPageState extends State<DangNhapPage> {
  ValueNotifier<bool> isShowMatKhau = ValueNotifier(false);
  ValueNotifier<String> email = ValueNotifier("");
  ValueNotifier<String> matKhau = ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              constraints: BoxConstraints(minHeight: screenHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1eac7c),
                    ),
                  ),
                  TextFieldLoginWidget(
                    email: email,
                    matKhau: matKhau,
                    isShowMatKhau: isShowMatKhau,
                  ),
                  ButtonLoginWidget(
                    screenWidth: screenWidth,
                    title: "Đăng nhập",
                    onPress: () {},
                  ),
                  SizedBox(height: 30),
                  TextChangeScreenLoginWidget(
                    textAsk: "Chưa có tài khoản?",
                    textButton: "Đăng ký ngay",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DangKyPage()),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: myColors.blackOrWhite,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: myColors.whiteOrBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
