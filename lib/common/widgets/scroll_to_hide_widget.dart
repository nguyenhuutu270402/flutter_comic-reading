import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  const ScrollToHideWidget(
      {super.key,
      required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 300)});

  final Widget child;
  final ScrollController controller;
  final Duration duration;

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onListenController);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_onListenController);
  }

  void _onListenController() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward && !isVisible) {
      setState(() {
        isVisible = true;
      });
    } else if (direction == ScrollDirection.reverse && isVisible) {
      setState(() {
        isVisible = false;
      });
    }
  }

  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? 50 : 0,
      child: Wrap(children: [widget.child]),
      // child: widget.child,
    );
  }
}
