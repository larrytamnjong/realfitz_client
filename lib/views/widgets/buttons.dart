import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../resources/styles/text_styles.dart';

class PrimaryTextButton extends StatelessWidget {
  final TextDecoration? decoration;
  final Color? color;
  final double? fontSize;
  final Function onPressed;
  final String text;

  const PrimaryTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.decoration,
    this.color,
    this.fontSize,
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
          fontSize: fontSize,
          decorationThickness: AppSizes.s_05,
          decorationColor: color,
        ),
      ),
    );
  }
}

class PrimaryElevatedButton extends StatelessWidget {
  final Color? color;
  final String text;
  final Widget? child;
  final Function() onPressed;
  final TextStyle? textStyle;
  const PrimaryElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
     this.child,
    this.color,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(

        padding: MaterialStateProperty.all(
          const EdgeInsets.fromLTRB(
              AppPadding.p80, AppPadding.p8, AppPadding.p80, AppPadding.p8),
        ),
        backgroundColor: MaterialStateProperty.all(color ?? AppColors.primary),
      ),
      onPressed: onPressed,
      child:child ?? Text(
        text,
        style: textStyle??boldTextStyle.copyWith(color: AppColors.white,fontSize: FontSizes.f15),
        // style: textStyle??semiBoldTextStyle.copyWith(color: AppColors.white),
      ),
    );
  }
}

class LargeGradientButton extends StatelessWidget {
  final List<Color> colors;
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final Function onPressed;
  const LargeGradientButton({
    super.key,
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.r15),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: AppSizes.s50,
          color: AppColors.white,
        ),
        title: Text(
          title,
          style: boldTextStyle.copyWith(
              fontSize: FontSizes.f16, color: AppColors.white),
        ),
        trailing: Icon(
          Icons.arrow_circle_right_rounded,
          color: AppColors.white,
        ),
        subtitle: Text(subtitle,
            style: regularTextStyle.copyWith(color: AppColors.white)),
        onTap: () {
          onPressed();
        },
      ),
    );
  }
}

class OutlineTileButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final IconData icon;
  final Color? iconColor;
  final bool? showTrailing;

  const OutlineTileButton({
    super.key,
    this.onTap,
    required this.text,
    required this.icon,
    this.showTrailing = true,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.only(
          left: AppPadding.p16,
          right: AppPadding.p16,
          top: AppPadding.p1,
          bottom: AppPadding.p1,
        ),
        leading: Icon(
          icon,
          color: iconColor ?? AppColors.primary,
        ),
        title: Text(text, style: semiBoldTextStyle),
        trailing: showTrailing == true
            ? const Icon(
                Icons.arrow_forward_ios_rounded,
                size: AppSizes.s18,
              )
            : const SizedBox.shrink(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r10),
          side: BorderSide(
            color: AppColors.grey,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
