import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/screens/danh_muc/danh_muc_page.dart';
import 'package:comic_reading/screens/trang_chu/trang_chu_page.dart';
import 'package:comic_reading/screens/xep_hang/xep_hang_page.dart';
import 'package:comic_reading/screens/yeu_thich/yeu_thich_page.dart';
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
    YeuThichPage(),
    DanhMucPage(),
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
