import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/chi_tiet_chuong_page.dart';
import 'package:flutter/material.dart';

class DialogListChuong extends StatefulWidget {
  const DialogListChuong({
    Key? key,
    required this.listChuong,
    required this.index,
    required this.userInfor,
  }) : super(key: key);

  final List<ResultsChuong> listChuong;
  final int index;
  final userInfor;

  @override
  _DialogListChuongState createState() => _DialogListChuongState();
}

class _DialogListChuongState extends State<DialogListChuong> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        widget.index * 56, // Kích thước của mỗi item trong ListView
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(16),
      child: Container(
        constraints: BoxConstraints(maxHeight: screenHeight * 0.6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: myColors.backgroundColorBottomSheet,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.listChuong.length,
          controller: _scrollController, // Thêm ScrollController vào ListView
          itemBuilder: (BuildContext context, int index) {
            return TouchOpacityWidget(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ChiTietChuongPage(
                        idChuong: widget.listChuong[index].id!,
                        idTruyen: widget.listChuong[index].idtruyen!,
                        index: index,
                        userInfor: widget.userInfor),
                  ),
                );
              },
              child: Container(
                height: 56,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text(
                        widget.listChuong[index].tenchuong!,
                        style: TextStyle(
                            color: myColors.blackOrWhite, fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                          ),
                          Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                              color: index == widget.index
                                  ? AppColors.ogrange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: index == widget.index
                                      ? Colors.grey
                                      : Colors.transparent,
                                  width: 2),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
