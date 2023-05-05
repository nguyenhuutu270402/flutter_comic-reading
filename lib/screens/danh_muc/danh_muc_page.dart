import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/header_bar_widget.dart';
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.black,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Tài khoản",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.network(
                                "https://bizweb.dktcdn.net/100/303/962/files/87126502-2509242206005371-2073523065622364160-n-f697e400-e8b2-4bb1-9698-d00b50b2d9c3.jpg?v=1627804121650",
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                children: [
                                  Text("Nguyen Van A"),
                                  Text("Nguyen Van A"),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
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
