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
        child: TextButton(
          onPressed: () {},
          child: Text('Xếp hạng'),
        ),
      ),
    );
  }
}
