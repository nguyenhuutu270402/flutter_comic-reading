import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/button_login_widget.dart';
import 'package:comic_reading/common/widgets/text_change_screen_login_widget.dart';
import 'package:comic_reading/common/widgets/text_field_register_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    final apiProvider = ApiProvider();

    void onDangKy() async {
      final RegExp regex =
          RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
      bool checkEmail = regex.hasMatch(email.value.toLowerCase());
      if (checkEmail == false) {
        Fluttertoast.showToast(
          msg: "Vui lòng nhập đúng email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          textColor: Colors.white,
          fontSize: 14.0,
        );
        return;
      } else if (matKhau.value.indexOf(' ') != -1) {
        Fluttertoast.showToast(
          msg: "Mật khẩu không được chứa dấu cách",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          textColor: Colors.white,
          fontSize: 14.0,
        );
        return;
      } else if (matKhau.value.length < 6) {
        Fluttertoast.showToast(
          msg: "Mật khẩu phải có ít nhất 6 ký tự",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          textColor: Colors.white,
          fontSize: 14.0,
        );
        return;
      } else if (matKhau.value != matKhauLai.value) {
        Fluttertoast.showToast(
          msg: "Mật khẩu không trùng khớp",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          textColor: Colors.white,
          fontSize: 14.0,
        );
        return;
      }
      final response =
          await apiProvider.checkRegister(email.value.toLowerCase());
      if (response.data['results'] == false) {
        Fluttertoast.showToast(
          msg: "Email này đã được đăng ký",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          textColor: Colors.white,
          fontSize: 14.0,
        );
        return;
      }
      final response2 =
          await apiProvider.addUser(email.value.toLowerCase(), matKhau.value);
      Fluttertoast.showToast(
        msg: "Đăng ký thành công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        textColor: Colors.white,
        fontSize: 14.0,
      );
      Navigator.pop(context);
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
                    textAsk: "Đã có tài khoản?  ",
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
