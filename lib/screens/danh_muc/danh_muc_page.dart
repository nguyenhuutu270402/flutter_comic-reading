import 'package:comic_reading/bottom_nav/bottom_nav.dart';
import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/shared_prefes/shared_prefes.dart';
import 'package:comic_reading/common/widgets/box_thong_tin_tai_khoan.dart';
import 'package:comic_reading/common/widgets/header_bar_widget.dart';
import 'package:comic_reading/common/widgets/item_khac_widget.dart';
import 'package:comic_reading/screens/dang_nhap/dang_nhap_page.dart';
import 'package:comic_reading/screens/danh_muc/cubit/danh_muc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DanhMucPage extends StatefulWidget {
  const DanhMucPage({super.key});

  @override
  State<DanhMucPage> createState() => _DanhMucPageState();
}

class _DanhMucPageState extends State<DanhMucPage> {
  var bloc = DanhMucCubit();
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
    final mySharedPrefes = MySharedPrefes();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
            bloc: bloc,
            builder: (context, state) {
              if (state is DanhMucLoading) {
                return const Text('Loading');
              } else if (state is DanhMucFailure) {
                return const Text('Failure');
              } else if (state is DanhMucSuccess) {
                var userInfor = state.userInfor;
                print(userInfor);
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 20,
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    "Tài khoản",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                if (userInfor != null)
                                  BoxThongTinTaiKhoan(
                                    userInfor: userInfor,
                                    onTap: () {},
                                  )
                                else
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        "Chưa đăng nhập",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                SizedBox(height: 10),
                              ],
                            ),
                            Container(
                              color: Colors.grey,
                              height: 0.2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 20,
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    "Khác",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                ItemKhacWidget(
                                  icon: Icon(
                                    Icons.category_outlined,
                                    size: 28,
                                    color: Colors.green,
                                  ),
                                  title: "Thể loại",
                                  onTap: () {
                                    print("Thể loại");
                                  },
                                ),
                                ItemKhacWidget(
                                  icon: Icon(
                                    Icons.history,
                                    size: 28,
                                    color: Colors.green,
                                  ),
                                  title: "Lịch sử",
                                  onTap: () {
                                    print("Lịch sử");
                                  },
                                ),
                                ItemKhacWidget(
                                  icon: Icon(
                                    Icons.manage_search_sharp,
                                    size: 28,
                                    color: Colors.green,
                                  ),
                                  title: "Tìm truyện",
                                  onTap: () {
                                    print("Tìm truyện");
                                  },
                                ),
                                userInfor == null
                                    ? ItemKhacWidget(
                                        icon: Icon(
                                          Icons.login_outlined,
                                          size: 28,
                                          color: Colors.blue,
                                        ),
                                        title: "Đăng nhập",
                                        onTap: () {
                                          // pushReplacement
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DangNhapPage()),
                                          );
                                        },
                                      )
                                    : ItemKhacWidget(
                                        icon: Icon(
                                          Icons.logout_outlined,
                                          size: 28,
                                          color: Colors.red,
                                        ),
                                        title: "Đăng xuất",
                                        onTap: () async {
                                          await mySharedPrefes.removeUserInfo();
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => BottomNav(),
                                            ),
                                          );
                                        },
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //header bar
                    HeaderBarWidget(
                      screenWidth: screenWidth,
                      myColors: myColors,
                      title: 'Danh mục',
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
      ),
    );
  }
}
