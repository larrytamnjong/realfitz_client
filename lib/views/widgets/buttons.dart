import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../styles/text_styles.dart';

class PrimaryTextButton extends StatelessWidget {
  final TextDecoration? decoration;
  final Color? color;
  final Function onPressed;
  final String text;
  const PrimaryTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.decoration,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: regularTextStyle.copyWith(
          color: color ?? AppColors.primary,
          decoration: decoration,
          decorationThickness: 0.5,
          decorationColor: color,
        ),
      ),
    );
  }
}

class PrimaryElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const PrimaryElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(
              AppPadding.p80, AppPadding.p8, AppPadding.p80, AppPadding.p8)),
          backgroundColor: MaterialStateProperty.all(AppColors.primary)),
      onPressed: onPressed,
      child: Text(
        text,
        style: semiBoldTextStyle.copyWith(color: AppColors.white),
      ),
    );
  }
}
