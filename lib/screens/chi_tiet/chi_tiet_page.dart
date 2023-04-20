import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/screens/chi_tiet/cubit/chi_tiet_cubit.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/chi_tiet_chuong_page.dart';
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
    bloc.initData(widget.id, 1);
  }

  bool isShowMota = false;

  @override
  Widget build(BuildContext context) {
    String formatDateCapNhat(String ngaycapnhat) {
      DateTime dateTimeData = DateTime.parse(ngaycapnhat);
      return '[Cập nhật lúc: ${dateTimeData.hour.toString().padLeft(2, '0')}:${dateTimeData.minute.toString().padLeft(2, '0')} ${dateTimeData.day.toString().padLeft(2, '0')}/${dateTimeData.month.toString().padLeft(2, '0')}/${dateTimeData.year}]';
    }

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
              var listTheLoai = state.listTheLoai.results;
              var listTacGia = state.listTacGia.results;
              var listChuong = state.listChuong.results;

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
                                formatDateCapNhat(
                                    ct_truyen.ngaycapnhat.toString()),
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
                                      children: listTacGia!
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int index = entry.key;
                                        return InkWell(
                                          onTap: () {},
                                          child: Text(
                                            index == listTacGia.length - 1
                                                ? '${listTacGia[index].tentacgia}'
                                                : '${listTacGia[index].tentacgia} - ',
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
                                      children: listTheLoai!
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int index = entry.key;
                                        dynamic item = entry.value;
                                        return InkWell(
                                          onTap: () {},
                                          child: Text(
                                            index == listTheLoai.length - 1
                                                ? '${listTheLoai[index].tentheloai.toString()}'
                                                : '${listTheLoai[index].tentheloai.toString()} - ',
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
                                          idChuong: int.parse(
                                              listChuong![listChuong.length - 1]
                                                  .id
                                                  .toString()),
                                          idTruyen: widget.id,
                                          index: listChuong.length - 1,
                                        ),
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
                                    isShowMota ? 'Xem thêm>' : '<Thu gọn',
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
                                  myColors: myColors, listChuong: listChuong!),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //header bar
                    HeaderBarWidget(
                      screenWidth: screenWidth,
                      myColors: myColors,
                      title: 'Thông tin truyện',
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
