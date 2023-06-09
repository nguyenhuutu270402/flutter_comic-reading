import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/custom_app_bar_widget.dart';
import 'package:comic_reading/common/widgets/my_grid_view_theo_loai_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/yeu_thich/cubit/yeu_thich_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YeuThichPage extends StatefulWidget {
  const YeuThichPage({super.key});

  @override
  State<YeuThichPage> createState() => _YeuThichPageState();
}

class _YeuThichPageState extends State<YeuThichPage> {
  var bloc = YeuThichCubit();
  ValueNotifier<List> data = ValueNotifier([]);
  var mainData;
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 5;
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
        _scrollController.position.maxScrollExtent - 50) {
      _loadMoreItems();
    } else if (_scrollController.position.pixels == 0) {}
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

  Future<void> _refreshData() async {
    data.value.clear();
    _currentMax = 5;
    bloc.initData();
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
      appBar: const CustomAppBarWidget(tiltle: "Theo dõi"),
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is YeuThichLoading) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (state is YeuThichFailure) {
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
            } else if (state is YeuThichSuccess) {
              var userInfor = state.userInfor;
              if (userInfor != null) {
                mainData = state.data.data["results"];
                for (var i = 0; i < _currentMax; i++) {
                  if (mainData.length > i) {
                    data.value.add(mainData[i]);
                  }
                }
              }
              return RefreshIndicator(
                onRefresh: _refreshData,
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    // SliverAppBar(
                    //   floating: true,
                    //   snap: true,
                    //   pinned: true,
                    //   title: Text(
                    //     "Theo dõi",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         color: myColors.blackOrWhite),
                    //   ),
                    //   centerTitle: true,
                    //   backgroundColor: myColors.whiteOrBlack,
                    // ),
                    userInfor == null
                        ? SliverToBoxAdapter(
                            child: TouchOpacityWidget(
                              onTap: _refreshData,
                              child: Container(
                                child: Text("Chưa đăng nhập"),
                              ),
                            ),
                          )
                        : ValueListenableBuilder(
                            valueListenable: data,
                            builder: (context, value, child) {
                              return MyGridViewTheLoaiWidget(
                                  data: data.value,
                                  crossAxisCount: crossAxisCount,
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                  currentMax: _currentMax);
                            },
                          )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
