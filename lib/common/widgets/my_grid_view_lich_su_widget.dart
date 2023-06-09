import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/chi_tiet/chi_tiet_page.dart';
import 'package:flutter/material.dart';

class MyGridViewLichSuWidget extends StatelessWidget {
  const MyGridViewLichSuWidget({
    super.key,
    required this.data,
    required this.crossAxisCount,
    required this.screenHeight,
    required this.screenWidth,
    required this.currentMax,
    required this.onDeleteLichSu,
  });

  final List<dynamic> data;
  final int crossAxisCount;
  final double screenHeight;
  final double screenWidth;
  final int currentMax;
  final Function(int) onDeleteLichSu;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index < data.length) {
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
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: TouchOpacityWidget(
                                onTap: () {
                                  onDeleteLichSu(data[index]["id"]);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: Text(
                                    "Xóa",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                                'Đang đọc chap ${data[index]["sochuong"]}',
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
            }
            // else if (currentMax > data.length) {
            //   return Text("Hết rồi!!!!!!!!!!");
            // } else {
            //   return _buildLoader();
            // }
          },
          childCount: data.length,
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32),
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
