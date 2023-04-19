import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DialogDanhGia extends StatelessWidget {
  const DialogDanhGia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            initialRating: 2,
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
              // TODO: xử lý đánh giá của người dùng
              print('rating>>> ${rating}');
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
            // TODO: xử lý đánh giá của người dùng
            Navigator.of(context).pop();
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
