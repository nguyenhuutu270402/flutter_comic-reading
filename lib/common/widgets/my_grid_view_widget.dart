import 'package:comic_reading/screens/chi_tiet/chi_tiet_page.dart';
import 'package:comic_reading/screens/trang_chu/model/truyen.dart';
import 'package:flutter/material.dart';

class MyGridViewWidget extends StatelessWidget {
  const MyGridViewWidget({
    super.key,
    required this.data,
    required this.crossAxisCount,
    required this.screenHeight,
    required this.screenWidth,
  });

  final List<Results> data;
  final int crossAxisCount;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    String testDateTime(String dateString) {
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChiTietPage(id: int.parse(data[index].id.toString())),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: screenHeight,
                          width: screenWidth,
                          child: Ink.image(
                            image: NetworkImage(
                              data[index].imagelink!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            top: 5,
                            left: 5,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                testDateTime(data[index].ngaycapnhat!),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: screenWidth,
                          alignment: Alignment.topLeft,
                          child: Text(
                            data[index].tentruyen!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Chapter ${data[index].chuongmoinhat!}',
                            style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
