import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:flutter/material.dart';

class TimKiemPage extends StatefulWidget {
  const TimKiemPage({super.key});

  @override
  State<TimKiemPage> createState() => _TimKiemPageState();
}

class _TimKiemPageState extends State<TimKiemPage> {
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
        slivers: [
          SliverAppBar(
            backgroundColor: myColors.whiteOrBlack,
            elevation: 2,
            floating: true,
            snap: true,
            title: TextField(
              onChanged: (value) {
                print(value);
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
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 2000,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
