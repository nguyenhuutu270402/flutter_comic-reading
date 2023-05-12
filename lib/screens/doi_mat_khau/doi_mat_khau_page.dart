import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:flutter/material.dart';

class DoiMatKhauPage extends StatefulWidget {
  const DoiMatKhauPage({super.key, this.userInfor});
  final userInfor;
  @override
  State<DoiMatKhauPage> createState() => _DoiMatKhauPageState();
}

class _DoiMatKhauPageState extends State<DoiMatKhauPage> {
  ValueNotifier<bool> isShowMatKhauCu = ValueNotifier(false);
  ValueNotifier<bool> isShowMatKhauMoi = ValueNotifier(false);
  ValueNotifier<bool> isShowMatKhauLai = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: true,
            title: Text(
              "Đổi mật khẩu",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: myColors.blackOrWhite),
            ),
            centerTitle: true,
            backgroundColor: myColors.whiteOrBlack,
          ),
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
                          print(value);
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
                          print(value);
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
                          print(value);
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
