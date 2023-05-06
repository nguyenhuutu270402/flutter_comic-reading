import 'dart:convert';

import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/button_login_widget.dart';
import 'package:comic_reading/common/widgets/text_change_screen_login_widget.dart';
import 'package:comic_reading/common/widgets/text_field_login_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/dang_ky/dang_ky_page.dart';
import 'package:comic_reading/screens/danh_muc/danh_muc_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

// example1@gmail.com
// password123

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
    final apiProvider = ApiProvider();

    void saveNguoiDung(dynamic data) async {
      // Khởi tạo một đối tượng SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      // Chuyển đổi đối tượng Map JSON thành chuỗi JSON
      final jsonString = jsonEncode(data);
      // Lưu trữ chuỗi JSON vào SharedPreferences
      await prefs.setString('nguoidung', jsonString);
    }

    // void readnguoidung() async {
    //   final prefs = await SharedPreferences.getInstance();
    //   final jsonString = prefs.getString('nguoidung');
    //   if (jsonString != null) {
    //     final data = jsonDecode(jsonString);
    //     print(data['id']); // in ra giá trị của thuộc tính 'id'
    //     print(data['email']); // in ra giá trị của thuộc tính 'email'
    //     print(data['tennguoidung']);
    //   } else {
    //     print('Không tìm thấy dữ liệu người dùng');
    //   }
    // }

    // void removeNguoiDung() async {
    //   final prefs = await SharedPreferences.getInstance();
    //   prefs.remove('nguoidung');
    // }

    void onDangNhap() async {
      if (email.value == "" || matKhau.value == "") {
        Fluttertoast.showToast(
          msg: "Email và mật khẩu không được để trống",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          textColor: Colors.white,
          fontSize: 14.0,
        );
        return;
      }

      final response = await apiProvider.loginUser(email.value, matKhau.value);
      if (response.data['results'] == false) {
        Fluttertoast.showToast(
          msg: "Email hoặc mật khẩu không đúng",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          textColor: Colors.white,
          fontSize: 14.0,
        );
        return;
      }
      saveNguoiDung(response.data['results']);
      Fluttertoast.showToast(
        msg: "Đăng nhập thành công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        textColor: Colors.white,
        fontSize: 14.0,
      );
      Navigator.pop(context);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => DanhMucPage(),
        ),
      );
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
                      onPress: onDangNhap),
                  SizedBox(height: 30),
                  TextChangeScreenLoginWidget(
                    textAsk: "Chưa có tài khoản? ",
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
            top: 40,
            left: 16,
            child: TouchOpacityWidget(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
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
