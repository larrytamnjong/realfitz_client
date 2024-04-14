import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../../../resources/styles/text_styles.dart';

class Term extends StatelessWidget {
  final String text;
  final String title;

  const Term({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.r5),
            color: AppColors.palePrimary,
          ),
          height: AppSizes.s40,
          width: MediaQuery.sizeOf(context).width / 1.8,
          child: Center(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: AppPadding.p5),
                child: Text(
                  title,
                  style: boldTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.s10),
        Text(
          text,
          style: mediumTextStyle,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: AppSizes.s18),
      ],
    );
  }
}
