import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/shared_prefes/shared_prefes.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/tai_khoan/cubit/tai_khoan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaiKhoanPage extends StatefulWidget {
  const TaiKhoanPage({super.key});

  @override
  State<TaiKhoanPage> createState() => _TaiKhoanPageState();
}

class _TaiKhoanPageState extends State<TaiKhoanPage> {
  var bloc = TaiKhoanCubit();
  @override
  void initState() {
    super.initState();
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
            if (state is TaiKhoanLoading) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else if (state is TaiKhoanFailure) {
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
            } else if (state is TaiKhoanSuccess) {
              var userInfor = state.userInfor;

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    pinned: true,
                    title: Text(
                      "Tài khoản",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: myColors.blackOrWhite),
                    ),
                    centerTitle: true,
                    backgroundColor: myColors.whiteOrBlack,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            userInfor["avatar"] != null
                                ? CachedNetworkImage(
                                    imageUrl: userInfor["avatar"].toString(),
                                    width: screenWidth * 0.5,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => Container(
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      alignment: Alignment.center,
                                      color: Colors.grey,
                                      child: Text("Image error"),
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 80,
                                  ),
                            TouchOpacityWidget(
                              onTap: () {
                                print("chon anh");
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Chọn ảnh",
                                ),
                              ),
                            ),
                            TextField(
                              onChanged: (value) {
                                print(value);
                              },
                              decoration: InputDecoration(),
                            ),
                          ],
                        )),
                  )
                ],
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
