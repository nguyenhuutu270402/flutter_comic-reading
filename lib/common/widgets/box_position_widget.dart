import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/my_function/my_function.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/common/widgets/scroll_to_hide_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/chi_tiet_chuong_page.dart';
import 'package:comic_reading/common/widgets/comment_sliding_sheet_widget.dart';
import 'package:comic_reading/common/widgets/dia_log_list_chuong_widget.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_binh_luan.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

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
      required this.isFollow,
      required this.updateListComment,
      required this.controller});

  final double screenHeight;
  final CustomThemeExtension myColors;
  final List<ResultsChuong> listChuong;
  final double screenWidth;
  final List<Results> listComment;
  final int id;
  final int index;
  final userInfor;
  final ValueNotifier<bool> isFollow;
  final Function(dynamic) updateListComment;
  final ScrollController controller;

  @override
  State<BoxPosition> createState() => _BoxPositionState();
}

class _BoxPositionState extends State<BoxPosition> {
  late SheetController sheetController = SheetController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SizedBox(
        height: widget.screenHeight,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: ScrollToHideWidget(
                controller: widget.controller,
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
                            if (widget.listChuong != null &&
                                widget.listChuong.isNotEmpty) {
                              MyFunction().addLuotXem(
                                widget.userInfor,
                                widget.listChuong[widget.index - 1].id!,
                                widget.listChuong[widget.index - 1].idtruyen!,
                              );
                            }
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
                          valueListenable: widget.isFollow,
                          builder: (context, value, child) {
                            return TouchOpacityWidget(
                              onTap: () async {
                                bool success = await MyFunction().onTheoDoi(
                                    widget.userInfor,
                                    widget.isFollow.value,
                                    widget.listChuong[widget.index].idtruyen!);
                                if (success) {
                                  widget.isFollow.value =
                                      !widget.isFollow.value;
                                }
                                // isFollow.value = !isFollow.value;
                              },
                              child: Icon(
                                widget.isFollow.value == false
                                    ? Icons.favorite_outline
                                    : Icons.favorite,
                                color: Colors.red,
                              ),
                            );
                          }),
                      TouchOpacityWidget(
                        onTap: () async {
                          if (widget.userInfor == null) {
                            Fluttertoast.showToast(
                              msg: "Chưa đăng nhập",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color.fromARGB(255, 52, 52, 52),
                              textColor: Colors.white,
                              fontSize: 14.0,
                            );
                            return;
                          }
                          // final data = await ApiProvider().onGetListComment(
                          //     widget.listChuong[widget.index].idtruyen!);
                          showMySlidingSheet(
                              context,
                              widget.listComment,
                              widget.userInfor,
                              widget.listChuong[widget.index].idtruyen!,
                              widget.updateListComment,
                              sheetController);
                        },
                        child:
                            Icon(Icons.message_outlined, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
