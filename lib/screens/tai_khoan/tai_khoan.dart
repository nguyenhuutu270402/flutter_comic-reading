import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/custom_app_bar_widget.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:comic_reading/screens/tai_khoan/cubit/tai_khoan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class TaiKhoanPage extends StatefulWidget {
  const TaiKhoanPage({super.key});

  @override
  State<TaiKhoanPage> createState() => _TaiKhoanPageState();
}

class _TaiKhoanPageState extends State<TaiKhoanPage> {
  File? _image;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        print("image>>>> : ${_image!}");
        // Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

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
      appBar: CustomAppBarWidget(
        tiltle: "Tài khoản",
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
                  // SliverAppBar(
                  //   floating: true,
                  //   snap: true,
                  //   pinned: true,
                  //   title: Text(
                  //     "Tài khoản",
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: myColors.blackOrWhite),
                  //   ),
                  //   centerTitle: true,
                  //   backgroundColor: myColors.whiteOrBlack,
                  // ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          if (userInfor["avatar"] != null && _image == null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: CachedNetworkImage(
                                imageUrl: userInfor["avatar"].toString(),
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  alignment: Alignment.center,
                                  color: Colors.grey,
                                  child: Text("Image error"),
                                ),
                              ),
                            )
                          else
                            _image == null
                                ? Icon(
                                    Icons.person,
                                    size: 100,
                                  )
                                : SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      backgroundImage: FileImage(
                                        _image!,
                                      ),
                                      radius: 200,
                                    ),
                                  ),
                          SizedBox(height: 16),
                          TouchOpacityWidget(
                            onTap: () {
                              _pickImage(ImageSource.gallery);
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
                          SizedBox(height: 30),
                          TextField(
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Tên của bạn',
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Lưu",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              fixedSize: Size(110, 40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
