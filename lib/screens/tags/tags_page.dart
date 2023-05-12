import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/tags/cubit/tags_cubit.dart';
import 'package:comic_reading/screens/the_loai/the_loai_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  ValueNotifier<List> data = ValueNotifier([]);
  var mainData;
  final ScrollController _scrollController = ScrollController();
  int _currentMax = 20;
  var bloc = TagsCubit();
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
    for (int i = _currentMax; i < _currentMax + 5; i++) {
      if (i < mainData.length) {
        data.value.add(mainData[i]);
      }
    }
    _currentMax = _currentMax + 5;
    data.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    int crossAxisCount = 2;

    if (screenWidth > 600) {
      crossAxisCount = 4;
    }
    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is TagsLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else if (state is TagsFailure) {
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
          } else if (state is TagsSuccess) {
            mainData = state.data.results;
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
                  title: Text(
                    "Thể loại",
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
                    return GridViewTagsWidget(
                      data: data.value,
                      currentMax: _currentMax,
                      crossAxisCount: crossAxisCount,
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

class GridViewTagsWidget extends StatelessWidget {
  const GridViewTagsWidget(
      {super.key,
      required this.data,
      required this.currentMax,
      required this.crossAxisCount});
  final data;
  final int currentMax;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index < data.length) {
              return Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: TouchOpacityWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TheLoaiPage(
                            tacGia: null,
                            theLoai: data[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        data[index].tentheloai,
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
              );
            }
          },
          childCount: data.length,
        ),
      ),
    );
  }
}
