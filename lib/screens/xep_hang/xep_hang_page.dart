import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/list_view_xep_hang_widget.dart';
import 'package:comic_reading/screens/xep_hang/cubit/xep_hang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XepHangPage extends StatefulWidget {
  const XepHangPage({super.key});

  @override
  State<XepHangPage> createState() => _XepHangPageState();
}

class _XepHangPageState extends State<XepHangPage> {
  ValueNotifier<List> data = ValueNotifier([]);
  var mainData;
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 4;
  var bloc = XepHangCubit();
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
        _scrollController.position.maxScrollExtent - 20) {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is XepHangLoading) {
            return Text('Loading');
          } else if (state is XepHangFailure) {
            return Text('Failure');
          } else if (state is XepHangSuccess) {
            mainData = state.data.data["results"];

            for (var i = 0; i < _currentMax; i++) {
              if (mainData.length > i) {
                data.value.add(mainData[i]);
              }
            }
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  // pinned: true,
                  title: Text(
                    "Xếp hạng",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: myColors.blackOrWhite),
                  ),
                  centerTitle: true,
                  backgroundColor: myColors.whiteOrBlack,
                ),
                ValueListenableBuilder(
                  valueListenable: data,
                  builder: (context, value, child) {
                    return ListViewXepHangWidget(
                      data: data.value,
                      screenWidth: screenWidth,
                      currentMax: _currentMax,
                    );
                  },
                )
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
