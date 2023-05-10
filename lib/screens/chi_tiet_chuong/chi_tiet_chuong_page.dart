import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/box_position_widget.dart';
import 'package:comic_reading/common/widgets/dia_log_list_chuong_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
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
      required this.idTruyen,
      required this.userInfor});
  final int idChuong;
  final int idTruyen;
  final int index;
  final userInfor;

  @override
  State<ChiTietChuongPage> createState() => _ChiTietChuongPageState();
}

class _ChiTietChuongPageState extends State<ChiTietChuongPage> {
  ValueNotifier<bool> isFollow = ValueNotifier(false);
  ValueNotifier<dynamic> listComment = ValueNotifier([]);
  final ScrollController _scrollController = ScrollController();

  var bloc = ChiTietChuongCubit();
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    if (widget.userInfor != null) {
      final response = await ApiProvider()
          .kiemTraTheoDoi(widget.userInfor['id'], widget.idTruyen);
      bloc.initData(widget.idChuong, widget.idTruyen, widget.userInfor['id']);
      isFollow.value = response.data['results'];
    } else {
      bloc.initData(widget.idChuong, widget.idTruyen, 1);
    }
  }

  void updateListComment(data) async {
    listComment.value = data;
    listComment.notifyListeners();

    // setState(() {});
    print("co vao day nha $data");
    print("list add>:  ${listComment.value}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is ChiTietChuongLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else if (state is ChiTietChuongFailure) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Có lỗi sảy ra',
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Tải lại"),
                  ),
                ],
              ),
            );
          } else if (state is ChiTietChuongSuccess) {
            var listImage = state.listImage.results;
            listComment.value = state.listBinhLuan.results;
            var listChuong = state.listChuong.results;

            if (listImage!.isEmpty) {
              return Text('Empty listImage');
            } else {
              return Stack(
                children: [
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        title: Text(
                          "Chapter ${listChuong![widget.index].sochuong}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: myColors.blackOrWhite),
                        ),
                        centerTitle: true,
                        backgroundColor: myColors.whiteOrBlack,
                        leading: TouchOpacityWidget(
                          child: Icon(
                            Icons.arrow_back,
                            color: myColors.blackOrWhite,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        actions: [
                          TouchOpacityWidget(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DialogListChuong(
                                    listChuong: listChuong,
                                    index: widget.index,
                                    userInfor: widget.userInfor,
                                  );
                                },
                              );
                            },
                            child: SizedBox(
                              width: 50,
                              child: Icon(Icons.list,
                                  color: myColors.blackOrWhite),
                            ),
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: ListView.builder(
                          itemCount: listImage.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.grey,
                              child: CachedNetworkImage(
                                imageUrl: listImage[index].imagelink.toString(),
                                // imageUrl: "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  height: 200,
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: 200,
                                  alignment: Alignment.center,
                                  color: Colors.grey,
                                  child: Text("Image error"),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  ValueListenableBuilder(
                    valueListenable: listComment,
                    builder: (context, value, child) {
                      return BoxPosition(
                        screenHeight: screenHeight,
                        myColors: myColors,
                        listChuong: listChuong,
                        screenWidth: screenWidth,
                        listComment: listComment.value,
                        id: widget.idChuong,
                        index: widget.index,
                        userInfor: widget.userInfor,
                        isFollow: isFollow,
                        updateListComment: updateListComment,
                        controller: _scrollController,
                      );
                    },
                  ),
                ],
              );
            }
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
