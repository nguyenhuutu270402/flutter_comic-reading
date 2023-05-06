import 'package:flutter/material.dart';

class TouchOpacityWidget extends StatefulWidget {
  const TouchOpacityWidget(
      {super.key,
      required this.child,
      this.activeOpacity,
      this.onTap,
      this.onLongPress});
  final Widget child;
  final Function()? onTap;
  final Function()? onLongPress;
  final double? activeOpacity;

  @override
  State<TouchOpacityWidget> createState() => _TouchOpacityWidgetState();
}

class _TouchOpacityWidgetState extends State<TouchOpacityWidget> {
  double _currentOpacity = 1;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() {
        _currentOpacity = widget.activeOpacity ?? 0.5;
      }),
      onPointerUp: (_) => setState(() {
        _currentOpacity = 1;
      }),
      child: GestureDetector(
        onTap: widget.onTap ?? () {},
        onLongPress: widget.onLongPress ?? () {},
        child: Opacity(
          opacity: _currentOpacity,
          child: widget.child,
        ),
      ),
    );
  }
}
