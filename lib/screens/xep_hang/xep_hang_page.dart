import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:flutter/material.dart';

class XepHangPage extends StatefulWidget {
  const XepHangPage({super.key});

  @override
  State<XepHangPage> createState() => _XepHangPageState();
}

class _XepHangPageState extends State<XepHangPage> {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            // pinned: true,
            title: Text(
              "Xếp hạng",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: myColors.blackOrWhite),
            ),
            centerTitle: true,
            backgroundColor: myColors.whiteOrBlack,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index < items.length) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                } else {
                  return _buildLoader();
                }
              },
              childCount: items.length + 1,
            ),
          ),
        ],
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
