import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void showMySlidingSheet(BuildContext context, List data) {
  showSlidingBottomSheet(
    context,
    builder: (context) => SlidingSheetDialog(
      cornerRadius: 8,
      snapSpec: SnapSpec(
        snappings: [0.5, 0.9],
      ),
      builder: (context, state) => buildSheet(context, state, data),
      footerBuilder: (context, state) => buildFooter(
        context,
        state,
      ),
      headerBuilder: (context, state) => buildHeader(
        context,
        state,
      ),
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
                child: Image.network(
                  data[index]['avatar'],
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
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
                            data[index]['tennguoidung'],
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
                            data[index]['noidung'],
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

Widget buildFooter(
  BuildContext context,
  SheetState state,
) {
  // sử dụng giá trị của data ở đây
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
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              // color: Colors.yellow,
              child: TextField(
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
          // SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            splashRadius: 22,
            icon: Icon(Icons.send),
            color: AppColors.ogrange,
          )
        ],
      ),
    ),
  );
}

Widget buildHeader(
  BuildContext context,
  SheetState state,
) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

  // sử dụng giá trị của data ở đây
  return Material(
    child: Container(
      width: screenWidth,
      // padding: EdgeInsets.all(8.0),
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            '676 bình luận',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          // Text('676 bình luận'),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              splashRadius: 10,
              onPressed: () {},
              icon: Icon(Icons.clear),
            ),
          ),
        ],
      ),
    ),
  );
}
