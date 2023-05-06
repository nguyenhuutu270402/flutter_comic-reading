import 'package:comic_reading/common/api/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogDanhGia extends StatelessWidget {
  const DialogDanhGia({
    super.key,
    required this.userInfor,
    required this.idTruyen,
  });
  final userInfor;
  final idTruyen;

  @override
  Widget build(BuildContext context) {
    double sosao = 1;
    void onDanhGia() async {
      if (userInfor == null) {
        Fluttertoast.showToast(
          msg: "Chưa đăng nhập",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 52, 52, 52),
          textColor: Colors.white,
          fontSize: 14.0,
        );
        Navigator.of(context).pop();

        return;
      }
      EasyLoading.show(status: 'Loading...');
      final response =
          await ApiProvider().kiemTraDanhGia(userInfor['id'], idTruyen);
      bool isDanhGia = response.data['results'];
      if (isDanhGia == false) {
        await ApiProvider().addDanhGia(userInfor['id'], idTruyen, sosao);
      } else {
        await ApiProvider().updateDanhGia(userInfor['id'], idTruyen, sosao);
      }
      EasyLoading.dismiss();
      Navigator.of(context).pop();

      // print("${sosao} :sosao: ${response.data['results']}");
    }

    return AlertDialog(
      title: Text(
        'Đánh giá',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Hãy cho chúng tôi biết đánh giá của bạn'),
          SizedBox(height: 16),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 36,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              sosao = rating;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Hủy'),
        ),
        ElevatedButton(
          onPressed: () {
            onDanhGia();
          },
          child: Text('Đánh giá'),
        ),
      ],
      insetPadding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ),
      clipBehavior: Clip.antiAlias,
    );
  }
}
