import 'package:comic_reading/common/widgets/touch_opacity_widget.dart';
import 'package:flutter/material.dart';

class TextChangeScreenLoginWidget extends StatelessWidget {
  const TextChangeScreenLoginWidget({
    super.key,
    required this.textAsk,
    required this.textButton,
    required this.onPress,
  });
  final String textAsk;
  final String textButton;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAsk,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        TouchOpacityWidget(
          onTap: onPress,
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF1eac7c),
            ),
          ),
        )
      ],
    );
  }
}
