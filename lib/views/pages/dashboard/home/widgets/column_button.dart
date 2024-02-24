import 'package:flutter/material.dart';

import '../../../../styles/text_styles.dart';

class VerticalTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final IconData icon;
  const VerticalTextButton({
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
