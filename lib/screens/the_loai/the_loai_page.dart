import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TheLoaiPage extends StatefulWidget {
  const TheLoaiPage(
      {super.key, required this.idTacGia, required this.idTheLoai});

  final idTacGia;
  final idTheLoai;

  @override
  State<TheLoaiPage> createState() => _TheLoaiPageState();
}

class _TheLoaiPageState extends State<TheLoaiPage> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
