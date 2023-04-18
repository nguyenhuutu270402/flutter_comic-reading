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
    ),
  );
}

Widget buildSheet(BuildContext context, SheetState state, List data) {
  // sử dụng giá trị của data ở đây
  return Material(
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(data.toString()), // hiển thị giá trị của data
          Container(
            height: 30,
            color: Colors.red,
          ),
        ],
      ),
    ),
  );
}
