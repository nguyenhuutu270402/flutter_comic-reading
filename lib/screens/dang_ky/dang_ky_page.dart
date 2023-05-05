import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/button_login_widget.dart';
import 'package:comic_reading/common/widgets/text_change_screen_login_widget.dart';
import 'package:comic_reading/common/widgets/text_field_register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DangKyPage extends StatefulWidget {
  const DangKyPage({super.key});

  @override
  State<DangKyPage> createState() => _DangKyPageState();
}

class _DangKyPageState extends State<DangKyPage> {
  ValueNotifier<bool> isShowMatKhau = ValueNotifier(false);
  ValueNotifier<bool> isShowMatKhauLai = ValueNotifier(false);
  ValueNotifier<String> email = ValueNotifier("");
  ValueNotifier<String> matKhau = ValueNotifier("");
  ValueNotifier<String> matKhauLai = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    void onDangKy() {
      print(email.value);
      print(matKhau.value);
      print(matKhauLai.value);
    }

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
                    "Đăng ký",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1eac7c),
                    ),
                  ),
                  TextFieldRegisterWidget(
                    email: email,
                    matKhau: matKhau,
                    matKhauLai: matKhauLai,
                    isShowMatKhau: isShowMatKhau,
                    isShowMatKhauLai: isShowMatKhauLai,
                  ),
                  ButtonLoginWidget(
                      screenWidth: screenWidth,
                      title: "Đăng ký",
                      onPress: onDangKy),
                  SizedBox(height: 30),
                  TextChangeScreenLoginWidget(
                    textAsk: "Đã có tài khoản?",
                    textButton: "Đăng nhập",
                    onPress: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
