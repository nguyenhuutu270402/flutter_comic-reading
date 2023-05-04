import 'dart:async';

import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/box_position_widget.dart';
import 'package:comic_reading/screens/chi_tiet_chuong/cubit/chi_tiet_chuong_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChiTietChuongPage extends StatefulWidget {
  const ChiTietChuongPage(
      {super.key,
      required this.idChuong,
      required this.index,
      required this.idTruyen});
  final int idChuong;
  final int idTruyen;
  final int index;

  @override
  State<ChiTietChuongPage> createState() => _ChiTietChuongPageState();
}

class _ChiTietChuongPageState extends State<ChiTietChuongPage> {
  late final ScrollController _scrollController;
  bool _showBoxPosition = true;
  Timer? _timer;
  var bloc = ChiTietChuongCubit();
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    bloc.initData(widget.idChuong, widget.idTruyen, 1);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _timer?.cancel(); // Hủy bỏ đối tượng Timer hiện tại (nếu có)
      _timer = Timer(Duration(milliseconds: 1000), () {
        _showBoxPosition = true;
        setState(() {});
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _timer?.cancel(); // Hủy bỏ đối tượng Timer hiện tại (nếu có)
      _timer = Timer(Duration(milliseconds: 1000), () {
        _showBoxPosition = false;
        setState(() {});
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is ChiTietChuongLoading) {
              return Text('Loading');
            } else if (state is ChiTietChuongFailure) {
              return Text('Failure');
            } else if (state is ChiTietChuongSuccess) {
              var listImage = state.listImage.results;
              var listComment = state.listBinhLuan.results;
              var listChuong = state.listChuong.results;

              if (listImage!.isEmpty) {
                return Text('Empty listImage');
              }
              if (listChuong!.isEmpty) {
                return Text('Empty listChuong');
              } else {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: listImage.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                  color: Colors.grey,
                                  child: Image.network(
                                      listImage[index].imagelink.toString()));
                            },
                          ),
                        ],
                      ),
                    ),
                    if (_showBoxPosition)
                      BoxPosition(
                        screenHeight: screenHeight,
                        myColors: myColors,
                        listChuong: listChuong,
                        screenWidth: screenWidth,
                        listComment: listComment!,
                        id: widget.idChuong,
                        index: widget.index,
                      ),
                  ],
                );
              }
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}