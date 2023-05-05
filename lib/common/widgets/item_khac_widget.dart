import 'package:flutter/material.dart';

class ItemKhacWidget extends StatelessWidget {
  const ItemKhacWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final Icon icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            icon,
            SizedBox(width: 16),
            Text(title),
          ],
        ),
      ),
    );
  }
}
