import 'package:comic_reading/controller/truyen_controller.dart';
import 'package:comic_reading/models/truyen.dart';
import 'package:comic_reading/repository/truyen_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class XepHangPage extends StatefulWidget {
  const XepHangPage({super.key});

  @override
  State<XepHangPage> createState() => _XepHangPageState();
}

class _XepHangPageState extends State<XepHangPage> {
  @override
  Widget build(BuildContext context) {
    var truyenController = TruyenController(TruyenRepository());
    truyenController.fechListTruyen();
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
