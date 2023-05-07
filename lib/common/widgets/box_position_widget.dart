import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/my_function/my_function.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/chi_tiet_chuong_page.dart';
import 'package:comic_reading/common/widgets/comment_sliding_sheet_widget.dart';
import 'package:comic_reading/common/widgets/dia_log_list_chuong_widget.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_binh_luan.dart';
import 'package:flutter/material.dart';

class BoxPosition extends StatefulWidget {
  const BoxPosition(
      {super.key,
      required this.screenHeight,
      required this.myColors,
      required this.listChuong,
      required this.screenWidth,
      required this.listComment,
      required this.id,
      required this.index,
      required this.userInfor,
      required this.isFollow});

  final double screenHeight;
  final CustomThemeExtension myColors;
  final List<ResultsChuong> listChuong;
  final double screenWidth;
  final List<Results> listComment;
  final int id;
  final int index;
  final userInfor;
  final bool isFollow;
  @override
  State<BoxPosition> createState() => _BoxPositionState();
}

class _BoxPositionState extends State<BoxPosition> {
  ValueNotifier<bool> isFollow = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    // if (widget.userInfor != null) {
    //   final response = await ApiProvider().kiemTraTheoDoi(
    //       widget.userInfor['id'], widget.listChuong[widget.index].idtruyen!);
    //   isFollow.value = response.data['results'];
    // }
    isFollow.value = widget.isFollow;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SizedBox(
        height: widget.screenHeight,
        child: Stack(
          children: [
            Container(
              height: 50,
              color: widget.myColors.whiteOrBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TouchOpacityWidget(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 50,
                      child: Icon(Icons.arrow_back,
                          color: widget.myColors.blackOrWhite),
                    ),
                  ),
                  Text(
                    'Chapter ${widget.listChuong[widget.index].sochuong}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TouchOpacityWidget(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DialogListChuong(
                            listChuong: widget.listChuong,
                            index: widget.index,
                            userInfor: widget.userInfor,
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      child:
                          Icon(Icons.list, color: widget.myColors.blackOrWhite),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: widget.screenWidth,
                color: Colors.black.withOpacity(0.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (widget.index < widget.listChuong.length - 1)
                      TouchOpacityWidget(
                        onTap: () {
                          if (widget.listChuong != null &&
                              widget.listChuong.isNotEmpty) {
                            MyFunction().addLuotXem(
                              widget.userInfor,
                              widget.listChuong[widget.index + 1].id!,
                              widget.listChuong[widget.index + 1].idtruyen!,
                            );
                          }
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ChiTietChuongPage(
                                  idChuong:
                                      widget.listChuong[widget.index + 1].id!,
                                  idTruyen: widget
                                      .listChuong[widget.index + 1].idtruyen!,
                                  index: widget.index + 1,
                                  userInfor: widget.userInfor),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: AppColors.ogrange,
                            ),
                            Text(
                              'Trước',
                              style: TextStyle(
                                color: AppColors.ogrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget.index > 0)
                      TouchOpacityWidget(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ChiTietChuongPage(
                                  idChuong:
                                      widget.listChuong[widget.index - 1].id!,
                                  idTruyen: widget
                                      .listChuong[widget.index - 1].idtruyen!,
                                  index: widget.index - 1,
                                  userInfor: widget.userInfor),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Sau ',
                              style: TextStyle(
                                color: AppColors.ogrange,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.ogrange,
                            ),
                          ],
                        ),
                      ),
                    ValueListenableBuilder<bool>(
                        valueListenable: isFollow,
                        builder: (context, value, child) {
                          return TouchOpacityWidget(
                            onTap: () async {
                              print('tap favorite');
                              bool success = await MyFunction().onTheoDoi(
                                  widget.userInfor, isFollow.value, widget.id);
                              if (success) {
                                isFollow.value = !isFollow.value;
                              }
                              // isFollow.value = !isFollow.value;
                            },
                            child: Icon(
                              isFollow.value == false
                                  ? Icons.favorite_outline
                                  : Icons.favorite,
                              color: Colors.red,
                            ),
                          );
                        }),
                    TouchOpacityWidget(
                      onTap: () {
                        showMySlidingSheet(context, widget.listComment);
                      },
                      child: Icon(Icons.message_outlined, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
