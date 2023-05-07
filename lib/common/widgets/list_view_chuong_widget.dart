import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/my_function/my_function.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/chi_tiet_chuong_page.dart';
import 'package:flutter/material.dart';

class ListViewChuongWidget extends StatelessWidget {
  const ListViewChuongWidget(
      {super.key,
      required this.myColors,
      required this.listChuong,
      required this.userInfor});
  final List<ResultsChuong> listChuong;
  final CustomThemeExtension myColors;
  final userInfor;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listChuong.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            MyFunction().addLuotXem(
                userInfor, listChuong[index].id!, listChuong[index].idtruyen!);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChiTietChuongPage(
                    idChuong: listChuong[index].id!,
                    idTruyen: listChuong[index].idtruyen!,
                    index: index,
                    userInfor: userInfor),
              ),
            );
          },
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                              'Chapter ${listChuong[index].sochuong!}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color:
                                      listChuong[index].idnguoidungDaDoc != null
                                          ? Colors.grey
                                          : myColors.blackOrWhite),
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
                              MyFunction().formatDateTime(
                                  listChuong[index].ngaycapnhat.toString()),
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
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
                      ' ${listChuong[index].tongsoluot.toString()}',
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
    );
  }
}
