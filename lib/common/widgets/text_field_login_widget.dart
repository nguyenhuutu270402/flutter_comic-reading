import 'package:flutter/material.dart';

class TextFieldLoginWidget extends StatelessWidget {
  TextFieldLoginWidget({
    super.key,
    required this.email,
    required this.matKhau,
    required this.isShowMatKhau,
  });

  ValueNotifier<String> email;
  ValueNotifier<String> matKhau;
  ValueNotifier<bool> isShowMatKhau;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              email.value = value;
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
                    matKhau.value = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
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
        ],
      ),
    );
  }
}
