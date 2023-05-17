import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/my_function/my_function.dart';
import 'package:comic_reading/common/shared_prefes/shared_prefes.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/common/widgets/custom_app_bar_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/chi_tiet/cubit/chi_tiet_cubit.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/chi_tiet_chuong_page.dart';
import 'package:comic_reading/common/widgets/dia_log_danh_gia_widget.dart';
import 'package:comic_reading/common/widgets/list_view_chuong_widget.dart';
import 'package:comic_reading/screens/the_loai/the_loai_page.dart';
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
  var userInfor;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    userInfor = await MySharedPrefes().readUserInfo();
    if (userInfor != null) {
      bloc.initData(widget.id, userInfor['id']);
    } else {
      bloc.initData(widget.id, 0);
    }
  }

  ValueNotifier<bool> isShowMota = ValueNotifier(false);
  ValueNotifier<bool> isFollow = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      appBar: CustomAppBarWidget(
        tiltle: "Thông tin truyện",
        leading: TouchOpacityWidget(
          child: Icon(
            Icons.arrow_back,
            color: myColors.blackOrWhite,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is ChiTietLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          } else if (state is ChiTietFailure) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Có lỗi sảy ra',
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Tải lại"),
                  ),
                ],
              ),
            );
          } else if (state is ChiTietSuccess) {
            var ct_truyen = state.ct_truyen.results;
            var listTheLoai = state.listTheLoai.results;
            var listTacGia = state.listTacGia.results;
            var listChuong = state.listChuong.results;
            isFollow.value = state.isFollow.data['results'];
            if (ct_truyen == null) {
              return const Text('Empty');
            } else {
              return CustomScrollView(
                slivers: [
                  // SliverAppBar(
                  //   floating: true,
                  //   snap: true,
                  //   title: Text(
                  //     "Thông tin truyện",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: myColors.blackOrWhite),
                  //   ),
                  //   centerTitle: true,
                  //   backgroundColor: myColors.whiteOrBlack,
                  //   leading: TouchOpacityWidget(
                  //     child: Icon(
                  //       Icons.arrow_back,
                  //       color: myColors.blackOrWhite,
                  //     ),
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          child: Column(
                            children: [
                              Text(
                                ct_truyen.tentruyen.toString().toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                MyFunction().formatDateCapNhat(
                                    ct_truyen.ngaycapnhat.toString()),
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey),
                              ),
                              const SizedBox(height: 10),
                              CachedNetworkImage(
                                imageUrl: ct_truyen.imagelink.toString(),
                                width: screenWidth * 0.5,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => Container(
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  alignment: Alignment.center,
                                  color: Colors.grey,
                                  child: const Text("Image error"),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        const Text(
                                          '   Tên khác',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              height: 1.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      ct_truyen.tenkhac.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        const Text(
                                          '   Tác giả',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            height: 1.5,
                                          ),
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
                                        return TouchOpacityWidget(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TheLoaiPage(
                                                  tacGia: listTacGia[index],
                                                  theLoai: null,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            index == listTacGia.length - 1
                                                ? '${listTacGia[index].tentacgia}'
                                                : '${listTacGia[index].tentacgia} - ',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.blue,
                                              height: 1.5,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
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
                                        const Icon(
                                          Icons.signal_cellular_alt,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        const Text(
                                          '   Tình trạng',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            height: 1.5,
                                          ),
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
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
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
                                        const Icon(
                                          Icons.local_offer,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        const Text(
                                          '   Thể loại',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            height: 1.5,
                                          ),
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
                                        return TouchOpacityWidget(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TheLoaiPage(
                                                  theLoai: listTheLoai[index],
                                                  tacGia: null,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            index == listTheLoai.length - 1
                                                ? '${listTheLoai[index].tentheloai.toString()}'
                                                : '${listTheLoai[index].tentheloai.toString()} - ',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.blue,
                                              height: 1.5,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
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
                                        const Icon(
                                          Icons.remove_red_eye,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        const Text(
                                          '   Lượt xem',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      ct_truyen.tongluotxem.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TouchOpacityWidget(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return DialogDanhGia(
                                              userInfor: userInfor,
                                              idTruyen: widget.id,
                                            );
                                          },
                                        );
                                      },
                                      child: const Text(
                                        'Đánh giá: ',
                                        style: TextStyle(color: AppColors.blue),
                                      ),
                                    ),
                                    Text(
                                      '${ct_truyen.sosaotrungbinh ?? 0}/5 - ${ct_truyen.tongdanhgia} lượt đánh giá',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.topLeft,
                                height: 30,
                                child: Row(
                                  children: [
                                    ValueListenableBuilder<bool>(
                                        valueListenable: isFollow,
                                        builder: (context, value, child) {
                                          return ElevatedButton(
                                            onPressed: () async {
                                              bool success = await MyFunction()
                                                  .onTheoDoi(
                                                      userInfor,
                                                      isFollow.value,
                                                      widget.id);
                                              if (success) {
                                                isFollow.value =
                                                    !isFollow.value;
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  isFollow.value == false
                                                      ? AppColors.green
                                                      : Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              // fixedSize: Size(110, 30),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                                Text(
                                                    isFollow.value == false
                                                        ? 'Theo dõi'
                                                        : 'Bỏ theo dõi',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14)),
                                              ],
                                            ),
                                          );
                                        }),
                                    Text(
                                      '   ${ct_truyen.tongtheodoi.toString()}',
                                    ),
                                    const Text(
                                      ' Lượt theo dõi',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.topLeft,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (listChuong != null &&
                                        listChuong.isNotEmpty) {
                                      MyFunction().addLuotXem(
                                        userInfor,
                                        int.parse(
                                            listChuong[listChuong.length - 1]
                                                .id
                                                .toString()),
                                        widget.id,
                                      );
                                    }
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
                                          userInfor: userInfor,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Đọc từ đầu',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.ogrange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    fixedSize: const Size(110, 30),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(bottom: 2),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: AppColors.blue),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.description,
                                      color: AppColors.blue,
                                      size: 20,
                                    ),
                                    const Text(
                                      'NỘI DUNG',
                                      style: TextStyle(
                                          color: AppColors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              ValueListenableBuilder<bool>(
                                  valueListenable: isShowMota,
                                  builder: (context, value, child) {
                                    return Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            ct_truyen.mota.toString(),
                                            maxLines: value ? null : 3,
                                            overflow: value
                                                ? null
                                                : TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 14, height: 1.3),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: TouchOpacityWidget(
                                            onTap: () {
                                              isShowMota.value =
                                                  !isShowMota.value;
                                              // setState(() {});
                                            },
                                            child: Text(
                                              isShowMota.value
                                                  ? '<Thu gọn'
                                                  : 'Xem thêm>',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: isShowMota.value
                                                      ? Colors.purpleAccent
                                                      : AppColors.blue),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                              const SizedBox(height: 10),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(bottom: 2),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: AppColors.blue),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.description,
                                      color: AppColors.blue,
                                      size: 20,
                                    ),
                                    const Text(
                                      'DANH SÁCH CHƯƠNG',
                                      style: TextStyle(
                                          color: AppColors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListViewChuongWidget(
                            myColors: myColors,
                            listChuong: listChuong!,
                            userInfor: userInfor),
                      ],
                    ),
                  )
                ],
              );
            }
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
