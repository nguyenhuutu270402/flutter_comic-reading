import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/screens/trang_chu/trang_chu_page.dart';
import 'package:comic_reading/screens/xep_hang/xep_hang_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TrangChuPage(),
    XepHangPage(),
    Page3(),
    Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: myColors.whiteOrBlack,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset:
                  Offset(0, -1), // this is the important line for the shadow
            ),
          ],
        ),
        child: GNav(
          gap: 8,
          // backgroundColor: Colors.black,
          // color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey,
          padding: const EdgeInsets.all(15),
          hoverColor: Colors.blue,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Trang chủ',
            ),
            GButton(
              icon: Icons.star_border,
              text: 'Xếp hạng',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Theo dõi',
            ),
            GButton(
              icon: Icons.category,
              text: 'Danh mục',
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Theo dõi'),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Center(
        child: Text('Danh mục'),
      ),
    );
  }
}
