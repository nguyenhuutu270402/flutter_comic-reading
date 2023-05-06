import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:flutter/material.dart';

class XepHangPage extends StatefulWidget {
  const XepHangPage({super.key});

  @override
  State<XepHangPage> createState() => _XepHangPageState();
}

class _XepHangPageState extends State<XepHangPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: TouchOpacityWidget(
          // activeOpacity: 0.9,
          onTap: () {
            print("tap xep hang opacity");
          },
          onLongPress: () {
            print("long press ne");
          },
          child: Container(
            // color: Colors.red,
            child: Text('Xếp hạng'),
          ),
        ),
      ),
    );
  }
}
