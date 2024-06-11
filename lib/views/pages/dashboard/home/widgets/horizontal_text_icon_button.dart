import 'package:flutter/material.dart';

import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class HorizontalTextIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;
  final String text;
  const HorizontalTextIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:  AppPadding.p10,right: 10),
      child: Row(
        children: [
          Text(text, style: boldTextStyle.copyWith(fontSize: FontSizes.f15)),
          const SizedBox(width: AppSizes.s5),
          IconButton(onPressed: onPressed, icon: icon),
        ],
      ),
    );
  }
}
