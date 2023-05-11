import 'dart:async';

import 'package:comic_reading/common/api/api_provider.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/my_grid_view_theo_loai_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:flutter/material.dart';

class TimKiemPage extends StatefulWidget {
  const TimKiemPage({super.key});

  @override
  State<TimKiemPage> createState() => _TimKiemPageState();
}

class _TimKiemPageState extends State<TimKiemPage> {
  ValueNotifier<List> data = ValueNotifier([]);
  var mainData;

  final ScrollController _scrollController = ScrollController();
  int _currentMax = 4;
  Timer? searchTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
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

  void _timkiem(String search) {
    if (search != "") {
      searchTimer?.cancel();
      searchTimer = Timer(Duration(milliseconds: 500), () async {
        String qr =
            "WHERE concat(tentruyen, '', tenkhac) LIKE '%${search}%' GROUP BY truyen.id ORDER BY MAX(chuong.ngaycapnhat) desc";
        var response = await ApiProvider().layListTruyenTheoLoai(qr);
        mainData = response.data["results"];
        _currentMax = 4;
        data.value = [];
        for (var i = 0; i < _currentMax; i++) {
          if (mainData.length > i) {
            data.value.add(mainData[i]);
          }
        }
      });
    }
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            centerTitle: true,
            titleSpacing: 0,
            backgroundColor: myColors.whiteOrBlack,
            elevation: 2,
            floating: true,
            snap: true,
            title: TextField(
              onChanged: (value) {
                _timkiem(value);
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                filled: true,
                fillColor: myColors.whiteOrBlack,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
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
              Container(
                width: 10,
              )
            ],
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
      ),
    );
  }
}
