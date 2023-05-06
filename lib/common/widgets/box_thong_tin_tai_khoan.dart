import 'package:flutter/material.dart';

class BoxThongTinTaiKhoan extends StatelessWidget {
  const BoxThongTinTaiKhoan(
      {super.key, required this.userInfor, required this.onTap});
  final dynamic userInfor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: userInfor['avatar'] != null
                  ? Image.network(
                      userInfor['avatar'].toString(),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : const Icon(
                      Icons.person,
                      size: 60,
                    ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userInfor['tennguoidung'] != "" && userInfor['avatar'] != null
                      ? userInfor['tennguoidung']
                      : "Chưa cập nhật",
                  style: TextStyle(
                      fontSize: 16,
                      // color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 3),
                Text(
                  userInfor['email'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
