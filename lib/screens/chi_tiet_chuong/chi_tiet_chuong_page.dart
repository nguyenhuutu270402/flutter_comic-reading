import 'dart:async';

import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/box_position_widget.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/cubit/chi_tiet_chuong_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChiTietChuongPage extends StatefulWidget {
  const ChiTietChuongPage(
      {super.key,
      required this.idChuong,
      required this.index,
      required this.idTruyen});
  final int idChuong;
  final int idTruyen;
  final int index;

  @override
  State<ChiTietChuongPage> createState() => _ChiTietChuongPageState();
}

class _ChiTietChuongPageState extends State<ChiTietChuongPage> {
  late final ScrollController _scrollController;
  bool _showBoxPosition = true;
  Timer? _timer;
  var bloc = ChiTietChuongCubit();
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
    },
  ];

  List<Map<String, dynamic>> listComment = [
    {
      "id": 49,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Hay",
      "ngaybinhluan": "2023-03-22T12:14:56.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 47,
      "idnguoidung": 10,
      "idtruyen": 1,
      "noidung": "Nice",
      "ngaybinhluan": "2023-02-28T13:04:53.000Z",
      "tennguoidung": "Lê Văn Duẫn",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1677589325446_2f9609ce-7e98-4779-98c8-329e417fdf8e.jpeg?alt=media&token=55e59b08-1a02-4dd0-b229-7646bc82441f"
    },
    {
      "id": 46,
      "idnguoidung": 9,
      "idtruyen": 1,
      "noidung": "Chào",
      "ngaybinhluan": "2023-02-24T02:55:55.000Z",
      "tennguoidung": "Meo meo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1677379216043_5cfd7bed-7375-476b-b69d-2d0fa3f40a0a.jpeg?alt=media&token=452e1e5c-59c3-43b4-9b79-b03a7105b809"
    },
    {
      "id": 44,
      "idnguoidung": 8,
      "idtruyen": 1,
      "noidung": "Hay đấy",
      "ngaybinhluan": "2023-02-12T22:30:07.000Z",
      "tennguoidung": "Hà Thu",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676240973274_d75a08dd-e8b8-4ef6-9dd4-5dcd44852361.jpeg?alt=media&token=1309928b-26e4-4f99-b2b1-95b82d22a872"
    },
    {
      "id": 43,
      "idnguoidung": 7,
      "idtruyen": 1,
      "noidung": "Xuất sắc",
      "ngaybinhluan": "2023-02-12T22:20:01.000Z",
      "tennguoidung": "Lý Thị Hoa",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676240265667_cca93e6c-621c-4ea8-822e-d0ae8b83d9f2.jpeg?alt=media&token=1b9be1a8-07d0-4ca8-8d72-9a6e718926ac"
    },
    {
      "id": 42,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Hay quá",
      "ngaybinhluan": "2023-02-12T21:55:49.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 40,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Test bình luận lần 3",
      "ngaybinhluan": "2023-02-10T22:31:32.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 39,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Test bình luận 2",
      "ngaybinhluan": "2023-02-10T22:29:49.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 38,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Test bình luận 1",
      "ngaybinhluan": "2023-02-10T22:28:38.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 37,
      "idnguoidung": 5,
      "idtruyen": 1,
      "noidung": "Tuyệt vời ông mặt trời :))",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "User 5",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 36,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 35,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Quá ghê gớm!!!!!!",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 34,
      "idnguoidung": 2,
      "idtruyen": 1,
      "noidung": "Hay ghê á!!!!!!",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "Nguyen Thi Hoa",
      "avatar":
          "https://genk.mediacdn.vn/zoom/700_438/2017/panda-1024-1488876248329-crop-1488876277745.jpg"
    },
    {
      "id": 33,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 31,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 32,
      "idnguoidung": 5,
      "idtruyen": 1,
      "noidung": "Tuyệt vời ông mặt trời :))",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "User 5",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 30,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Quá ghê gớm!!!!!!",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 29,
      "idnguoidung": 2,
      "idtruyen": 1,
      "noidung": "Hay ghê á!!!!!!",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "Nguyen Thi Hoa",
      "avatar":
          "https://genk.mediacdn.vn/zoom/700_438/2017/panda-1024-1488876248329-crop-1488876277745.jpg"
    },
    {
      "id": 28,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 27,
      "idnguoidung": 5,
      "idtruyen": 1,
      "noidung": "Tuyệt vời ông mặt trời :))",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "User 5",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 26,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 25,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Quá ghê gớm!!!!!!",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 24,
      "idnguoidung": 2,
      "idtruyen": 1,
      "noidung": "Hay ghê á!!!!!!",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "Nguyen Thi Hoa",
      "avatar":
          "https://genk.mediacdn.vn/zoom/700_438/2017/panda-1024-1488876248329-crop-1488876277745.jpg"
    },
    {
      "id": 23,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 6,
      "idnguoidung": 5,
      "idtruyen": 1,
      "noidung": "Tuyệt vời ông mặt trời :))",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "User 5",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 5,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 4,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Quá ghê gớm!!!!!!",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 3,
      "idnguoidung": 2,
      "idtruyen": 1,
      "noidung": "Hay ghê á!!!!!!",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "Nguyen Thi Hoa",
      "avatar":
          "https://genk.mediacdn.vn/zoom/700_438/2017/panda-1024-1488876248329-crop-1488876277745.jpg"
    },
    {
      "id": 2,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 1,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Hay quá!!!!!!",
      "ngaybinhluan": "2023-02-10T19:47:05.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 22,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Quá đỉnh :))",
      "ngaybinhluan": "2022-12-01T05:00:00.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    }
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    bloc.initData(widget.idChuong, widget.idTruyen, 1);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _timer?.cancel(); // Hủy bỏ đối tượng Timer hiện tại (nếu có)
      _timer = Timer(Duration(milliseconds: 1000), () {
        _showBoxPosition = true;
        setState(() {});
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _timer?.cancel(); // Hủy bỏ đối tượng Timer hiện tại (nếu có)
      _timer = Timer(Duration(milliseconds: 1000), () {
        _showBoxPosition = false;
        setState(() {});
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is ChiTietChuongLoading) {
              return Text('Loading');
            } else if (state is ChiTietChuongFailure) {
              return Text('Failure');
            } else if (state is ChiTietChuongSuccess) {
              var listImage = state.listImage.results;

              if (listImage!.isEmpty) {
                return Text('Empty');
              } else {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: listImage.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                  color: Colors.grey,
                                  child: Image.network(
                                      listImage[index].imagelink.toString()));
                            },
                          ),
                        ],
                      ),
                    ),
                    if (_showBoxPosition)
                      BoxPosition(
                        screenHeight: screenHeight,
                        myColors: myColors,
                        listChuong: listChuong,
                        screenWidth: screenWidth,
                        listComment: listComment,
                        id: widget.idChuong,
                        index: widget.index,
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
