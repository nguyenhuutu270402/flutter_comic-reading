import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/my_grid_view_widget.dart';
import 'package:comic_reading/common/widgets/slide_view_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/tim_kiem/tim_kiem_page.dart';
import 'package:comic_reading/screens/trang_chu/cubit/trang_chu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrangChuPage extends StatefulWidget {
  const TrangChuPage({super.key});

  @override
  State<TrangChuPage> createState() => _TrangChuPageState();
}

class _TrangChuPageState extends State<TrangChuPage> {
  var bloc = TrangChuCubit();
  // var data = [];
  ValueNotifier<List> data = ValueNotifier([]);
  var mainData;

  var data2;
  final ScrollController _scrollController = ScrollController();
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
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 0) {
      _loadMoreItems();
    }
  }

  void _loadMoreItems() {
    for (int i = _currentMax; i < _currentMax + 2; i++) {
      if (i < mainData.length) {
        data..value.add(mainData[i]);
      }
    }
    _currentMax = _currentMax + 2;
    data.notifyListeners();
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
            // statusBarColor:
            //     myColors.greyBackground, // Màu sắc cho thanh trạng thái
            ),
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
              for (var i = 0; i < _currentMax; i++) {
                if (mainData.length > i) {
                  data.value.add(mainData[i]);
                }
              }
              if (data.value == []) {
                return const Text('Empty');
              } else {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      title: Text(
                        "Trang chủ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: myColors.blackOrWhite),
                      ),
                      centerTitle: true,
                      backgroundColor: myColors.whiteOrBlack,
                      actions: [
                        SizedBox(
                          width: 50,
                          child: TouchOpacityWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TimKiemPage(),
                                  ));
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
                    ValueListenableBuilder(
                      valueListenable: data,
                      builder: (context, value, child) {
                        return MyGridViewWidget(
                            data: data.value,
                            crossAxisCount: crossAxisCount,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            currentMax: _currentMax);
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
      ),
    );
  }
}
