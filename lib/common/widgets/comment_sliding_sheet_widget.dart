import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/my_function/my_function.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void showMySlidingSheet(BuildContext context, List data, dynamic userInfor,
    int idTruyen, Function(dynamic) updateListComment) {
  showSlidingBottomSheet(
    context,
    builder: (context) => SlidingSheetDialog(
      cornerRadius: 8,
      snapSpec: SnapSpec(
        snappings: [0.5, 0.9],
      ),
      builder: (context, state) => buildSheet(context, state, data),
      footerBuilder: (context, state) => buildFooter(
          context, state, data, userInfor, idTruyen, updateListComment),
      headerBuilder: (context, state) => buildHeader(context, state, data),
    ),
  );
}

Widget buildSheet(BuildContext context, SheetState state, List data) {
  return Material(
    child: ListView.builder(
      itemCount: data.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl:
                      data[index].avatar != null ? data[index].avatar : "",
                  // imageUrl: "",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    alignment: Alignment.center,
                    color: Colors.grey,
                    child: Text("Error"),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            data[index].tennguoidung != ""
                                ? data[index].tennguoidung
                                : "Vô danh",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          '01/03/2023',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            data[index].noidung,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget buildFooter(BuildContext context, SheetState state, List data,
    dynamic userInfor, int idTruyen, Function(dynamic) updateListComment) {
  String valueComment = "";
  return Material(
    child: Container(
      height: 60,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          // color: Colors.red,
          ),
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: userInfor['avatar'] != null
                      ? userInfor['avatar']
                      : "", // imageUrl: "",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    alignment: Alignment.center,
                    color: Colors.grey,
                    child: Text("Error"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              child: TextField(
                onChanged: (value) {
                  valueComment = value;
                },
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: 'Bình luận...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          TouchOpacityWidget(
            onTap: () async {
              final newData = await MyFunction()
                  .addBinhLuan(userInfor, idTruyen, valueComment, context);
              updateListComment(newData);
            },
            child: Icon(
              Icons.send,
              color: AppColors.ogrange,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    ),
  );
}

Widget buildHeader(BuildContext context, SheetState state, List data) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

  return Material(
    child: Container(
      width: screenWidth,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            '${data.length} bình luận',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: TouchOpacityWidget(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.clear),
            ),
          ),
        ],
      ),
    ),
  );
}
