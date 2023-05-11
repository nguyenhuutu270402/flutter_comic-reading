import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/chi_tiet/chi_tiet_page.dart';
import 'package:flutter/material.dart';

class ListViewXepHangWidget extends StatelessWidget {
  ListViewXepHangWidget(
      {super.key,
      required this.data,
      required this.screenWidth,
      required this.currentMax});
  final List<dynamic> data;
  final double screenWidth;
  final int currentMax;

  Color setBackgroundColor(int index) {
    if (index == 0) {
      return Color(0XFF1e81c4);
    } else if (index == 1) {
      return Color(0xFFa4ce3c);
    } else if (index == 2) {
      return Color(0xFFfbc908);
    } else {
      return Color(0xFFd4d4d2).withOpacity(0.8);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index < data.length) {
              return TouchOpacityWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChiTietPage(
                          id: int.parse(data[index]["id"].toString())),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(10),
                  color: setBackgroundColor(index),
                  height: 170,
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: data[index]["imagelink"],
                        fit: BoxFit.cover,
                        width: 110,
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
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width: screenWidth,
                                child: Text(
                                  data[index]["tentruyen"]
                                      .toString()
                                      .toUpperCase(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: screenWidth,
                                child: Text(
                                  "Lượt xem: ${data[index]["tongluotxem"]}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: Container(
                                  width: screenWidth,
                                  child: Text(
                                    "${data[index]["mota"]}",
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else if (currentMax > data.length) {
              return Text("Hết rồi!!!!!!!!!!");
            } else {
              return _buildLoader();
            }
          },
          childCount: data.length + 1,
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
