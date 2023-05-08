import 'package:comic_reading/common/extension/custom_theme_extension.dart';
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
  var data;
  var mainData;

  var data2;
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _currentMax = 4;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    bloc.initData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreItems();
    }
  }

  void _loadMoreItems() {
    // if (!_isLoading) {
    //   setState(() {
    //     _isLoading = true;
    //   });

    //   for (int i = _currentMax; i < _currentMax + 2; i++) {
    //     if (i < mainData.length) {
    //       print(mainData[i]);

    //       data.add(mainData[i]);
    //     }
    //     _currentMax = _currentMax + 2;
    //     if (_currentMax > mainData.length) {
    //       _currentMax = mainData.length;
    //     }
    //   }

    //   // Thêm dữ liệu mới vào danh sách
    //   Future.delayed(Duration(seconds: 2), () {
    //     setState(() {
    //       // data.addAll(newItems);
    //       print("loading datathooiiiii");
    //       _isLoading = false;
    //     });
    //   });
    // }
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
          style: TextStyle(
              fontWeight: FontWeight.bold, color: myColors.blackOrWhite),
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
              child: Icon(
                Icons.search,
                size: 26,
                color: myColors.blackOrWhite,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder(
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
                    onPressed: () {
                      bloc.initData();
                    },
                    child: Text("Tải lại"),
                  ),
                ],
              ),
            );
          } else if (state is TrangChuSuccess) {
            mainData = state.data.results;
            data2 = state.data2.results;
            print(mainData[1]);
            if (data == []) {
              return const Text('Empty');
            } else {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
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
                      ],
                    ),
                  ),
                  MyGridViewWidget(
                      data: mainData,
                      crossAxisCount: crossAxisCount,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth),
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
