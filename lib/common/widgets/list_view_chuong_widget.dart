import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_chuong.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/chi_tiet_chuong_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    String formatDateTime(String dateString) {
      DateTime dateCurr = DateTime.now();
      DateTime dateTimeData = DateTime.parse(dateString);
      int intDateCurr = dateCurr.millisecondsSinceEpoch;
      int intDateData = dateTimeData.millisecondsSinceEpoch;
      int hieuSoDateTime = intDateCurr - intDateData;
      if (hieuSoDateTime < 3600000 && hieuSoDateTime > 0) {
        var minute = (hieuSoDateTime / 60000);
        return '${minute.toInt()} phút trước';
      } else if (hieuSoDateTime < 86400000 && hieuSoDateTime > 0) {
        var hours = (hieuSoDateTime / 3600000);
        return '${hours.toInt()} giờ trước';
      } else if (hieuSoDateTime < 2592000000) {
        var date = (hieuSoDateTime / 86400000);
        return '${date.toInt()}  ngày trước';
      } else if (hieuSoDateTime > 2592000000) {
        var date = dateTimeData.day;
        var month = dateTimeData.month;
        var year = dateTimeData.year;
        String dateFormat =
            '${date.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year}';
        return dateFormat;
      }
      return 'Null';
    }

    void addLuotXem(int idChuong, int idTruyen) async {
      if (userInfor == null) {
        await ApiProvider().addLuotXem(1, idChuong);
      } else {
        await ApiProvider().addLuotXem(userInfor['id'], idChuong);
        await ApiProvider().kiemTraLichSu(userInfor['id'], idTruyen, idChuong);
        await ApiProvider().kiemTraLichSuXemChuong(userInfor['id'], idChuong);
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listChuong.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            addLuotXem(listChuong[index].id!, listChuong[index].idtruyen!);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChiTietChuongPage(
                    idChuong: listChuong[index].id!,
                    idTruyen: listChuong[index].idtruyen!,
                    index: index),
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
                              formatDateTime(
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
