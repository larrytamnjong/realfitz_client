import 'package:flutter/material.dart';

import '../../../../resources/styles/text_styles.dart';

class VerticalTextWithIconButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final IconData icon;
  const VerticalTextWithIconButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: onPressed, icon: CircleAvatar(child: Icon(icon))),
        Text(
          text,
          style: regularTextStyle,
        )
      ],
    );
  }
}
