import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget(
      {super.key,
      this.leading,
      this.actions,
      this.backgroundColor,
      this.tiltle,
      this.isAppBarSearch,
      this.onTimKiem});

  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final String? tiltle;
  final bool? isAppBarSearch;
  final Function(String)? onTimKiem;
  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return AppBar(
      titleSpacing: 0,
      title: isAppBarSearch == true
          ? TextField(
              onChanged: (value) {
                onTimKiem!(value);
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
            )
          : Text(
              tiltle ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: myColors.blackOrWhite,
              ),
            ),
      centerTitle: true,
      backgroundColor: backgroundColor ?? myColors.whiteOrBlack,
      leading: leading ?? Container(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
