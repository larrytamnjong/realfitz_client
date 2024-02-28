import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/styles/text_styles.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

class ContainerHeader extends StatelessWidget {
  final String title;
  const ContainerHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.r5),
          color: AppColors.palePrimary,
        ),
        height: AppSizes.s40,
        width: MediaQuery.sizeOf(context).width,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: AppPadding.p8),
            child: Text(
              title,
              style: semiBoldTextStyle.copyWith(fontSize: FontSizes.f15),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
