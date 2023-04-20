import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/screens/chi_tiet/cubit/chi_tiet_cubit.dart';
import 'package:comic_reading/screens/chi_tiet_chuong_page.dart';
import 'package:comic_reading/common/widgets/dia_log_danh_gia_widget.dart';
import 'package:comic_reading/common/widgets/header_bar_widget.dart';
import 'package:comic_reading/common/widgets/list_view_chuong_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChiTietPage extends StatefulWidget {
  const ChiTietPage({super.key, required this.id});
  final int id;
  @override
  State<ChiTietPage> createState() => _ChiTietPageState();
}

class _ChiTietPageState extends State<ChiTietPage> {
  var bloc = ChiTietCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.initData(widget.id);
  }

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
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is ChiTietLoading) {
              return Text('Loading');
            } else if (state is ChiTietFailure) {
              return Text('Failure');
            } else if (state is ChiTietSuccess) {
              var ct_truyen = state.ct_truyen.results;
              // var data2 = state.data2.results;

              if (ct_truyen == null) {
                return Text('Empty');
              } else {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          width: screenWidth,
                          child: Column(
                            children: [
                              Text(
                                ct_truyen.tentruyen.toString().toUpperCase(),
                                textAlign: TextAlign.center,
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
                                ct_truyen.imagelink.toString(),
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
                                      ct_truyen.tenkhac.toString(),
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
                                      children: listTacGia
                                          .asMap()
                                          .entries
                                          .map((entry) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      ct_truyen.tinhtrang == 1
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      children: listTheLoai
                                          .asMap()
                                          .entries
                                          .map((entry) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      ct_truyen.tongluotxem.toString(),
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
                                            return DialogDanhGia();
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Đánh giá: ',
                                        style: TextStyle(color: AppColors.blue),
                                      ),
                                    ),
                                    Text(
                                      '${ct_truyen.sosaotrungbinh}/5 - ${ct_truyen.tongdanhgia} lượt đánh giá',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        fixedSize: Size(110, 30),
                                      ),
                                    ),
                                    Text(
                                      '   ${ct_truyen.tongtheodoi.toString()}',
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChiTietChuongPage(
                                            id: listChuong[
                                                listChuong.length - 1]['id'],
                                            index: listChuong.length - 1),
                                      ),
                                    );
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
                                  ct_truyen.mota.toString(),
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
                              ListViewChuongWidget(
                                  myColors: myColors, listChuong: listChuong),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //header bar
                    HeaderBarWidget(
                      screenWidth: screenWidth,
                      myColors: myColors,
                      title: 'ID truyện ${widget.id}',
                      iconButtonLeft: IconButton(
                        splashColor: Colors.black,
                        splashRadius: 22,
                        icon: Icon(Icons.arrow_back,
                            color: myColors.blackOrWhite),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              }
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
