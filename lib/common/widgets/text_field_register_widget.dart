import 'package:flutter/material.dart';

class TextFieldRegisterWidget extends StatelessWidget {
  TextFieldRegisterWidget({
    super.key,
    required this.email,
    required this.matKhau,
    required this.matKhauLai,
    required this.isShowMatKhau,
    required this.isShowMatKhauLai,
  });

  String email;
  String matKhau;
  String matKhauLai;
  ValueNotifier<bool> isShowMatKhau;
  ValueNotifier<bool> isShowMatKhauLai;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              email = value;
              print(email);
            },
            decoration: InputDecoration(
              hintText: 'Email',
              filled: true,
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: TextStyle(color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          SizedBox(height: 2),
          ValueListenableBuilder<bool>(
              valueListenable: isShowMatKhau,
              builder: (context, value, child) {
                return TextField(
                  onChanged: (value) {
                    matKhau = value;
                    print(matKhau);
                  },
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(20),
                      //   bottomRight: Radius.circular(20),
                      // ),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        isShowMatKhau.value = !isShowMatKhau.value;
                      },
                      child: Icon(
                        value == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  obscureText: !value,
                );
              }),
          SizedBox(height: 2),
          ValueListenableBuilder<bool>(
              valueListenable: isShowMatKhauLai,
              builder: (context, value, child) {
                return TextField(
                  onChanged: (value) {
                    matKhauLai = value;
                    print(matKhauLai);
                  },
                  decoration: InputDecoration(
                    hintText: 'Nhập lại mật khẩu',
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        isShowMatKhauLai.value = !isShowMatKhauLai.value;
                      },
                      child: Icon(
                        value == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  obscureText: !value,
                );
              }),
        ],
      ),
    );
  }
}
