import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/header_bar_widget.dart';
import 'package:comic_reading/common/widgets/my_grid_view_widget.dart';
import 'package:comic_reading/common/widgets/slide_view_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/trang_chu/cubit/trang_chu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrangChuPage extends StatefulWidget {
  const TrangChuPage({super.key});

  @override
  State<TrangChuPage> createState() => _TrangChuPageState();
}

class _TrangChuPageState extends State<TrangChuPage> {
  var bloc = TrangChuCubit();
  @override
  void initState() {
    super.initState();
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 2;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    if (screenWidth > 600) {
      crossAxisCount = 4;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trang chủ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: myColors.whiteOrBlack,
        actions: [
          SizedBox(
            width: 50,
            child: TouchOpacityWidget(
              onTap: () {
                print("tap icon seacrh");
              },
              child: const Icon(
                Icons.search,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is TrangChuLoading) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (state is TrangChuFailure) {
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
            } else if (state is TrangChuSuccess) {
              var data = state.data.results;
              var data2 = state.data2.results;

              if (data!.isEmpty) {
                return const Text('Empty');
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth,
                        margin: const EdgeInsets.only(top: 16, left: 10),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Truyện đề cử',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      // slide view
                      SlideViewWiget(data: data2!),
                      Container(
                        width: screenWidth,
                        margin: const EdgeInsets.only(
                            top: 10, left: 10, bottom: 16),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Truyện mới cập nhật',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      // GridView
                      MyGridViewWidget(
                          data: data,
                          crossAxisCount: crossAxisCount,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth),
                    ],
                  ),
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
