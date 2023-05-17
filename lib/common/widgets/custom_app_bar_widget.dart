import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget(
      {super.key,
      this.leading,
      this.actions,
      this.backgroundColor,
      required this.tiltle});

  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final String tiltle;
  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return AppBar(
      toolbarHeight: 200,
      title: Text(
        tiltle,
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
