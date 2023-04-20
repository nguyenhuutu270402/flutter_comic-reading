import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/chi_tiet_chuong_page.dart';
import 'package:comic_reading/common/widgets/comment_sliding_sheet_widget.dart';
import 'package:comic_reading/common/widgets/dia_log_list_chuong_widget.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/model/list_binh_luan.dart';
import 'package:flutter/material.dart';

class BoxPosition extends StatelessWidget {
  const BoxPosition({
    super.key,
    required this.screenHeight,
    required this.myColors,
    required this.listChuong,
    required this.screenWidth,
    required this.listComment,
    required this.id,
    required this.index,
  });

  final double screenHeight;
  final CustomThemeExtension myColors;
  final List<ResultsChuong> listChuong;
  final double screenWidth;
  final List<Results> listComment;
  final int id;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: screenHeight,
        child: Stack(
          children: [
            Container(
              height: 50,
              color: myColors.whiteOrBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    splashColor: Colors.black,
                    splashRadius: 22,
                    icon: Icon(Icons.arrow_back, color: myColors.blackOrWhite),
                  ),
                  Text(
                    'Chapter ${listChuong[index].sochuong}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DialogListChuong(
                            listChuong: listChuong,
                            index: index,
                          );
                        },
                      );
                    },
                    splashColor: Colors.black,
                    splashRadius: 22,
                    icon: Icon(Icons.list, color: myColors.blackOrWhite),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: screenWidth,
                color: Colors.black.withOpacity(0.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (index < listChuong.length - 1)
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ChiTietChuongPage(
                                idChuong: listChuong[index + 1].id!,
                                idTruyen: listChuong[index + 1].idtruyen!,
                                index: index + 1,
                              ),
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
                    if (index > 0)
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => ChiTietChuongPage(
                                idChuong: listChuong[index - 1].id!,
                                idTruyen: listChuong[index - 1].idtruyen!,
                                index: index - 1,
                              ),
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
                    IconButton(
                      onPressed: () {
                        print('tap favorite');
                      },
                      splashColor: Colors.black,
                      splashRadius: 22,
                      icon: Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showMySlidingSheet(context, listComment);
                      },
                      splashColor: Colors.black,
                      splashRadius: 22,
                      icon: Icon(Icons.message_outlined, color: Colors.green),
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
