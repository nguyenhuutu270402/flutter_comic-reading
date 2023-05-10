import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/xep_hang/cubit/xep_hang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XepHangPage extends StatefulWidget {
  const XepHangPage({super.key});

  @override
  State<XepHangPage> createState() => _XepHangPageState();
}

class _XepHangPageState extends State<XepHangPage> {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
  var bloc = XepHangCubit();
  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);
    bloc.initData();
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
            var data = state.data.data["results"];
            return CustomScrollView(
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
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < data.length) {
                          return TouchOpacityWidget(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              color: Colors.grey,
                              height: 200,
                            ),
                          );

                          return ListTile(
                            title: Text(data[index]["tentruyen"]),
                          );
                        } else {
                          return _buildLoader();
                        }
                      },
                      childCount: data.length + 1,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildLoader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32),
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
