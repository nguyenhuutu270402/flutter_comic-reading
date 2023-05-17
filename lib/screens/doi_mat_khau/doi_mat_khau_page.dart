import 'package:comic_reading/bottom_nav/bottom_nav.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/shared_prefes/shared_prefes.dart';
import 'package:comic_reading/common/widgets/custom_app_bar_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoiMatKhauPage extends StatefulWidget {
  const DoiMatKhauPage({super.key, required this.userInfor});
  final userInfor;
  @override
  State<DoiMatKhauPage> createState() => _DoiMatKhauPageState();
}

class _DoiMatKhauPageState extends State<DoiMatKhauPage> {
  ValueNotifier<bool> isShowMatKhauCu = ValueNotifier(false);
  ValueNotifier<bool> isShowMatKhauMoi = ValueNotifier(false);
  ValueNotifier<bool> isShowMatKhauLai = ValueNotifier(false);

  void _onDoiMatKhau(
      String matKhauCu, String matKhauMoi, String matKhauLai) async {
    if (matKhauCu.isEmpty || matKhauMoi.isEmpty || matKhauLai.isEmpty) {
      Fluttertoast.showToast(
        msg: "Vui lòng nhập đầy đủ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return;
    } else if (matKhauCu.toString() != widget.userInfor["matkhau"].toString()) {
      Fluttertoast.showToast(
        msg: "Mật khẩu cũ không đúng",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 52, 52, 52),
        textColor: Colors.white,
        fontSize: 14.0,
      );
      return;
    } else if (matKhauMoi.length < 6) {
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
    } else if (matKhauMoi != matKhauLai) {
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
    Fluttertoast.showToast(
      msg: "Đổi mật khẩu thành công",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromARGB(255, 52, 52, 52),
      textColor: Colors.white,
      fontSize: 14.0,
    );
    EasyLoading.show(status: 'Loading...');

    await ApiProvider().updatePasswordUser(matKhauMoi, widget.userInfor["id"]);
    widget.userInfor["matkhau"] = matKhauMoi;
    await MySharedPrefes().saveUserInfo(widget.userInfor);

    EasyLoading.dismiss();
    Navigator.pop(context);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => BottomNav(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    String matKhauCu = "";
    String matKhauMoi = "";
    String matKhauLai = "";

    return Scaffold(
      appBar: CustomAppBarWidget(
        tiltle: "Đổi mật khẩu",
        leading: TouchOpacityWidget(
          child: Icon(
            Icons.arrow_back,
            color: myColors.blackOrWhite,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   floating: true,
          //   snap: true,
          //   pinned: true,
          //   title: Text(
          //     "Đổi mật khẩu",
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold, color: myColors.blackOrWhite),
          //   ),
          //   centerTitle: true,
          //   backgroundColor: myColors.whiteOrBlack,
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  ValueListenableBuilder(
                    valueListenable: isShowMatKhauCu,
                    builder: (context, value, child) {
                      return TextField(
                        onChanged: (value) {
                          matKhauCu = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Mật khẩu cũ',
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.green,
                          ),
                          suffixIcon: TouchOpacityWidget(
                            onTap: () {
                              isShowMatKhauCu.value = !isShowMatKhauCu.value;
                            },
                            child: Icon(
                              value == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        obscureText: !value,
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  ValueListenableBuilder(
                    valueListenable: isShowMatKhauMoi,
                    builder: (context, value, child) {
                      return TextField(
                        onChanged: (value) {
                          matKhauMoi = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Mật khẩu mới',
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.green,
                          ),
                          suffixIcon: TouchOpacityWidget(
                            onTap: () {
                              isShowMatKhauMoi.value = !isShowMatKhauMoi.value;
                            },
                            child: Icon(
                              value == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        obscureText: !value,
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  ValueListenableBuilder(
                    valueListenable: isShowMatKhauLai,
                    builder: (context, value, child) {
                      return TextField(
                        onChanged: (value) {
                          matKhauLai = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Xác nhận mật khẩu',
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.green,
                          ),
                          suffixIcon: TouchOpacityWidget(
                            onTap: () {
                              isShowMatKhauLai.value = !isShowMatKhauLai.value;
                            },
                            child: Icon(
                              value == false
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        obscureText: !value,
                      );
                    },
                  ),
                  SizedBox(height: 26),
                  ElevatedButton(
                    onPressed: () {
                      // print("$matKhauCu / $matKhauMoi / $matKhauLai");
                      _onDoiMatKhau(matKhauCu, matKhauMoi, matKhauLai);
                    },
                    child: Text(
                      "Lưu",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      fixedSize: Size(screenWidth, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
