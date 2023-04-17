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
  List<Map<String, dynamic>> listChuong = [
    {
      "id": 67,
      "tenchuong": "Chapter 6: Tôi vs Nanase vs Em gái",
      "sochuong": 6,
      "ngaycapnhat": "2023-03-06T23:35:03.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": null,
      "tongsoluot": 7
    },
    {
      "id": 5,
      "tenchuong": "Chapter 5: Cuộc viếng thăm bất ngờ của cô em gái",
      "sochuong": 5,
      "ngaycapnhat": "2023-03-06T23:34:09.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 30
    },
    {
      "id": 4,
      "tenchuong": "Chapter 4: Hình phạt của Nanase",
      "sochuong": 4,
      "ngaycapnhat": "2023-03-06T23:32:31.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 20
    },
    {
      "id": 3,
      "tenchuong": "Chapter 3: Em yêu anh vì XX",
      "sochuong": 3,
      "ngaycapnhat": "2023-03-06T23:31:28.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 26
    },
    {
      "id": 2,
      "tenchuong": "Chapter 2: Nô lệ của công ty mất nhà",
      "sochuong": 2,
      "ngaycapnhat": "2023-03-06T23:29:53.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 36
    },
    {
      "id": 1,
      "tenchuong": "Chapter 1: Cô gái tên Nanase",
      "sochuong": 1,
      "ngaycapnhat": "2023-03-06T23:25:27.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 75
    }
  ];
  List<Map<String, dynamic>> listTacGia = [
    {"id": 1, "tentacgia": "Shinonome Toru"}
  ];
  List<Map<String, dynamic>> listTheLoai = [
    {
      "id": 6,
      "tentheloai": "Comedy",
      "mota":
          "Thể loại có nội dung trong sáng và cảm động, thường có các tình tiết gây cười, các xung đột nhẹ nhàng"
    },
    {
      "id": 11,
      "tentheloai": "Drama",
      "mota":
          "Thể loại mang đến cho người xem những cảm xúc khác nhau: buồn bã, căng thẳng thậm chí là bi phẫn"
    },
    {"id": 21, "tentheloai": "Manga", "mota": "Truyện tranh của Nhật Bản"},
    {
      "id": 30,
      "tentheloai": "Psychological",
      "mota":
          "Thể loại liên quan đến những vấn đề về tâm lý của nhân vật ( tâm thần bất ổn, điên cuồng ...)"
    },
    {
      "id": 31,
      "tentheloai": "Romance",
      "mota":
          "Thường là những câu chuyện về tình yêu, tình cảm lãng mạn. Ớ đây chúng ta sẽ lấy ví dụ như tình yêu giữa một người con trai và con gái, bên cạnh đó đặc điểm thể loại này là kích thích trí tưởng tượng của bạn về tình yêu"
    },
    {
      "id": 34,
      "tentheloai": "Seinen",
      "mota":
          "Thể loại của manga thường nhằm vào những đối tượng nam 18 đến 30 tuổi, nhưng người xem có thể lớn tuổi hơn, với một vài bộ truyện nhắm đến các doanh nhân nam quá 40. Thể loại này có nhiều phong cách riêng biệt , nhưng thể loại này có những nét riêng biệt, thường được phân vào những phong cách nghệ thuật rộng hơn và phong phú hơn về chủ đề, có các loại từ mới mẻ tiên tiến đến khiêu dâm"
    }
  ];

  bool isShowMota = false;
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
                      width: screenWidth,
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
                                child: Wrap(
                                  children:
                                      listTacGia.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    dynamic item = entry.value;
                                    return InkWell(
                                      onTap: () {},
                                      child: Text(
                                        index == listTacGia.length - 1
                                            ? '${item['tentacgia']}'
                                            : '${item['tentacgia']} - ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.blue),
                                      ),
                                    );
                                  }).toList(),
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
                                child: Wrap(
                                  children:
                                      listTheLoai.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    dynamic item = entry.value;
                                    return InkWell(
                                      onTap: () {},
                                      child: Text(
                                        index == listTheLoai.length - 1
                                            ? '${item['tentheloai']}'
                                            : '${item['tentheloai']} - ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: AppColors.blue),
                                      ),
                                    );
                                  }).toList(),
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
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return MyModal();
                                      },
                                    );
                                  },
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
                              maxLines: isShowMota ? 2000 : 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () {
                                isShowMota = !isShowMota;
                                setState(() {});
                              },
                              child: Text(
                                isShowMota ? 'Xem thêm>>' : '<<Rút gọn',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: isShowMota
                                        ? AppColors.blue
                                        : Colors.purpleAccent),
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
                                  'DANH SÁCH CHƯƠNG',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: listChuong.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.symmetric(vertical: 16),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          // color: Colors.red,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Chapter ${listChuong[index]['sochuong']}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: listChuong[index]
                                                                    [
                                                                    'idnguoidung_da_doc'] !=
                                                                null
                                                            ? Colors.grey
                                                            : myColors
                                                                .blackOrWhite),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.schedule,
                                                    size: 14,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    ' 07/03/2023',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.grey,
                                            size: 14,
                                          ),
                                          Text(
                                            ' ${listChuong[index]['tongsoluot'].toString()}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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

class MyModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.1),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Thông báo',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      'Chúng tôi không tìm thấy tài khoản với số điện thoại này',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 54, 54, 54),
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto'),
                    ),
                    const SizedBox(height: 22),
                    ElevatedButton(
                      onPressed: () {
                        // Xử lý sự kiện khi nhấn nút
                        Navigator.pop(context);
                      },
                      child: const Text('Quay lại',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF4A62F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: const Size(145, 48)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
