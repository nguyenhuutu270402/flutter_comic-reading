import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.onPress,
  });

  final double screenWidth;
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w100,
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF35343a),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fixedSize: Size(screenWidth, 50),
          elevation: 5),
    );
  }
}
