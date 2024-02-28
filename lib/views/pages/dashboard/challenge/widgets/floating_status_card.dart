import 'package:flutter/material.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class FloatingStatusCard extends StatelessWidget {
  final String text;

  final double? elevation;

  const FloatingStatusCard({
    super.key,
    required this.text,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p_5),
      child: Card(
        elevation: AppSizes.s1,
        color: AppColors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p15, vertical: AppPadding.p7),
          child: Text(
            text,
            style: regularTextStyle.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
