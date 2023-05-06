import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefes {
  Future<dynamic> saveUserInfo(dynamic data) async {
    // Khởi tạo một đối tượng SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // Chuyển đổi đối tượng Map JSON thành chuỗi JSON
    final jsonString = jsonEncode(data);
    // Lưu trữ chuỗi JSON vào SharedPreferences
    await prefs.setString('nguoidung', jsonString);
  }

  Future<dynamic> readUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('nguoidung');
    dynamic data;
    if (jsonString != null) {
      data = jsonDecode(jsonString);
      print(data);
    } else {
      data = null;
      print('Không tìm thấy dữ liệu người dùng');
    }
    return data;
  }

  Future<dynamic> removeUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('nguoidung');
  }
}
