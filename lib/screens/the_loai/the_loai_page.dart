import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/my_grid_view_theo_loai_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_tac_gia.dart';
import 'package:comic_reading/screens/chi_tiet/model/list_the_loai.dart';
import 'package:comic_reading/screens/the_loai/cubit/the_loai_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TheLoaiPage extends StatefulWidget {
  const TheLoaiPage({super.key, this.tacGia, this.theLoai});

  final ResultsTacGia? tacGia;
  final ResultsTheLoai? theLoai;

  @override
  State<TheLoaiPage> createState() => _TheLoaiPageState();
}

class _TheLoaiPageState extends State<TheLoaiPage> {
  var bloc = TheLoaiCubit();
  String headerTitle = "";
  ValueNotifier<List> data = ValueNotifier([]);
  var mainData;
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 4;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    initData();
  }

  void initData() {
    String lastQuery = "";
    if (widget.tacGia == null) {
      lastQuery =
          "where theloai.id = ${widget.theLoai?.id} GROUP BY truyen.id ORDER BY MAX(chuong.ngaycapnhat) desc ";
      headerTitle = widget.theLoai?.tentheloai ?? "";
    } else {
      lastQuery =
          "where tacgia.id = ${widget.tacGia?.id} GROUP BY truyen.id ORDER BY MAX(chuong.ngaycapnhat) desc ";
      headerTitle = widget.tacGia?.tentacgia ?? "";
    }
    bloc.initData(lastQuery);
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
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is TheLoaiLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else if (state is TheLoaiFailure) {
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
          } else if (state is TheLoaiSuccess) {
            mainData = state.data.data["results"];
            for (var i = 0; i < _currentMax; i++) {
              if (mainData.length > i) {
                data.value.add(mainData[i]);
              }
            }
            if (data.value.isEmpty) {
              return const Text('Empty');
            } else {
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    title: Text(
                      headerTitle,
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
                  ),
                  ValueListenableBuilder(
                    valueListenable: data,
                    builder: (context, value, child) {
                      return MyGridViewTheLoaiWidget(
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
    );
  }
}
