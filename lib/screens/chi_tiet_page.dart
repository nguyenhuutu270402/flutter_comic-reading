import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
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
  final isShowMota = false;
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
                      // alignment: Alignment.center,
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
                                fontStyle: FontStyle.italic,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 10),
                          Image.network(
                            item['imagelink'].toString(),
                            width: screenWidth * 0.5,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '   Tên khác',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Text(
                                  item['tenkhac'].toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '   Tác giả',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: InkWell(
                                  onTap: () {
                                    print('tap tac gia');
                                  },
                                  child: Text(
                                    item['tacgia'].toString(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.signal_cellular_alt,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '   Tình trạng',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Text(
                                  item['tinhtrang'] == 1
                                      ? 'Đang tiến hành'
                                      : 'Hoàn thành',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.local_offer,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '   Thể loại',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Text(
                                  item['theloai'].toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '   Lượt xem',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Text(
                                  item['tongluotxem'].toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  child: Text(
                                    'Đánh giá: ',
                                    style: TextStyle(color: myColors.blueColor),
                                  ),
                                ),
                                Text(
                                  '${item['sosaotrungbinh']}/5 - ${item['tongdanhgia']} lượt đánh giá',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 30,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Xử lý sự kiện khi nhấn nút
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      Text('Theo dõi',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14)),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    fixedSize: Size(110, 30),
                                  ),
                                ),
                                Text(
                                  '   ${item['tongtheodoi'].toString()}',
                                ),
                                Text(
                                  ' Lượt theo dõi',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                // Xử lý sự kiện khi nhấn nút
                              },
                              child: Text(
                                'Đọc từ đầu',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.ogrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                fixedSize: Size(110, 30),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(bottom: 2),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: AppColors.blue),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.description,
                                  color: AppColors.blue,
                                  size: 20,
                                ),
                                Text(
                                  'NỘI DUNG',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              item['mota'].toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              child: Text(
                                isShowMota ? 'Xem thêm>>' : '<<Rút gọn',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: isShowMota
                                        ? AppColors.blue
                                        : Colors.purpleAccent),
                              ),
                            ),
                          )
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
                          offset: Offset(0, 1),
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
