import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/header_bar_widget.dart';
import 'package:comic_reading/common/widgets/item_khac_widget.dart';
import 'package:comic_reading/screens/dang_nhap/dang_nhap_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DanhMucPage extends StatefulWidget {
  const DanhMucPage({super.key});

  @override
  State<DanhMucPage> createState() => _DanhMucPageState();
}

class _DanhMucPageState extends State<DanhMucPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    "https://bizweb.dktcdn.net/100/303/962/files/87126502-2509242206005371-2073523065622364160-n-f697e400-e8b2-4bb1-9698-d00b50b2d9c3.jpg?v=1627804121650",
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nguyen Van A",
                                      style: TextStyle(
                                          fontSize: 16,
                                          // color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      "example1@gmail.com",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
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
                        ItemKhacWidget(
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
                                  builder: (context) => DangNhapPage()),
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
              title: 'Trang chủ',
              iconButtonRight: IconButton(
                splashColor: Colors.black,
                splashRadius: 22,
                icon: Icon(Icons.search, color: myColors.blackOrWhite),
                onPressed: () {
                  print('Button timkiem pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
