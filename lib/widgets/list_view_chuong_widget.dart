import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/screens/chi_tiet_chuong_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListViewChuongWidget extends StatelessWidget {
  const ListViewChuongWidget(
      {super.key, required this.myColors, required this.listChuong});
  final List<Map<String, dynamic>> listChuong;
  final CustomThemeExtension myColors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listChuong.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChiTietChuongPage(
                    id: listChuong[index]['id'], index: index),
              ),
            );
          },
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(vertical: 16),
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
                              'Chapter ${listChuong[index]['sochuong']}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: listChuong[index]
                                              ['idnguoidung_da_doc'] !=
                                          null
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
                              ' 07/03/2023',
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
                      ' ${listChuong[index]['tongsoluot'].toString()}',
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
