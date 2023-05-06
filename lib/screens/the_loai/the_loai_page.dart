import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/header_bar_widget.dart';
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
  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    int crossAxisCount = 2;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    if (screenWidth > 600) {
      crossAxisCount = 4;
    }
    // return Container();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is TheLoaiLoading) {
              return const Text('Loading');
            } else if (state is TheLoaiFailure) {
              return const Text('Failure');
            } else if (state is TheLoaiSuccess) {
              var data = state.data.data["results"];
              if (data!.isEmpty) {
                return const Text('Empty');
              } else {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // GridView
                            MyGridViewTheLoaiWidget(
                                data: data,
                                crossAxisCount: crossAxisCount,
                                screenHeight: screenHeight,
                                screenWidth: screenWidth),
                          ],
                        ),
                      ),
                    ),
                    //header bar
                    HeaderBarWidget(
                      screenWidth: screenWidth,
                      myColors: myColors,
                      title: headerTitle,
                      iconButtonLeft: TouchOpacityWidget(
                        child: Icon(Icons.arrow_back,
                            color: myColors.blackOrWhite),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
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
