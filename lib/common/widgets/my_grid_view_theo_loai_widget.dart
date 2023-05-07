import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reading/common/my_function/my_function.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/chi_tiet/chi_tiet_page.dart';
import 'package:flutter/material.dart';

class MyGridViewTheLoaiWidget extends StatelessWidget {
  const MyGridViewTheLoaiWidget({
    super.key,
    required this.data,
    required this.crossAxisCount,
    required this.screenHeight,
    required this.screenWidth,
  });

  final data;
  final int crossAxisCount;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
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
            child: TouchOpacityWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChiTietPage(
                        id: int.parse(data[index]["id"].toString())),
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
                          child: CachedNetworkImage(
                            imageUrl: data[index]['imagelink'],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Container(
                              alignment: Alignment.center,
                              color: Colors.grey,
                              child: Text("Image error"),
                            ),
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
                                MyFunction()
                                    .formatDateTime(data[index]["ngaycapnhat"]),
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
                            data[index]["tentruyen"],
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
                            'Chapter ${data[index]["chuongmoinhat"]}',
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