import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class ChiTietPage extends StatefulWidget {
  const ChiTietPage({super.key, required this.id});
  final int id;
  @override
  State<ChiTietPage> createState() => _ChiTietPageState();
}

class _ChiTietPageState extends State<ChiTietPage> {
  var item = {
    "id": 1,
    "tentruyen": "Nanase-san no Koi ga Ijou",
    "tenkhac": "Cô nàng cuồng tình Nanase",
    "tinhtrang": 1,
    "mota":
        "Takahashi đã gặp được Nanase, một cô gái dễ thương và trong sáng thông qua ứng dụng hẹn hò. Quan hệ của cả hai ngày càng tiến triển một cách tốt đẹp rồi bỗng dưng một ngày nọ Takahashi được Nanase mời tới nhà mình chơi và chứng kiến một cảnh tượng bất ngờ",
    "imagelink":
        "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678169651281_co-nang-cuong-tinh-nanase.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725200400&Signature=H8p5Zwq4%2B90Li1i%2FkvglPeR6p4PjYqan4qoBsyeYqPUrWa9F%2FP41X%2FnK2SmYM9yC3eZgO6jNIJ4OCMo%2BdvZPRsHCEGlcSN9riP2hN3gIkEjqFi1U7B00W4KiDMf3qAOCE%2FmUryuH9OZ1j3prSmg6ZIqNnBiyb%2BtBuV4ZmP3rVH0DxLxvIHymVQPVS1LDEmCYQFm7Lh7sippEcn02j0h%2B2LoXib8nv43uOv%2FH9lYpsyWuGcRoSBxvSBnXy8nlrGIhjEKOJVlW1YzQRRkWYuEFATLU%2BLgogUNsaHzRgzU%2BNl0E3OLIlbIIhF3B9lhsSbd%2FtjpTJDHN1%2BKtpIxEts9DDQ%3D%3D",
    "tongluotxem": 194,
    "tongtheodoi": 8,
    "tongdanhgia": 11,
    "tongbinhluan": 31,
    "sosaotrungbinh": 3.8182,
    "ngaycapnhat": "2023-03-06T23:35:03.000Z",
    "chuongmoinhat": 6
  };
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      // color: Colors.red,
                      width: screenWidth,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            item['tentruyen'].toString().toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Cập nhật lúc: 17:44 07/03/2023',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 10),
                          Image.network(
                            item['imagelink'].toString(),
                            width: screenWidth * 0.5,
                            fit: BoxFit.contain,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text('Tên khác'),
                              ),
                              Expanded(
                                flex: 7,
                                child: Text(item['tenkhac'].toString()),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Stack(
                children: [
                  Container(
                    width: screenWidth,
                    height: 50,
                    decoration: BoxDecoration(
                      color: myColors.whiteOrBlack,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.1,
                          blurRadius: 0.1,
                          offset: Offset(0,
                              1), // Tạo đổ bóng chỉ ở phần bottom của Container
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'ID truyện ${widget.id}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      splashColor: Colors.black,
                      splashRadius: 22,
                      icon:
                          Icon(Icons.arrow_back, color: myColors.blackOrWhite),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
