import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';

class DividerHorizontal extends StatelessWidget {
  final double? padding;
  final double? thickness;
  const DividerHorizontal({
    super.key,
    this.padding,
    this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? AppPadding.p60),
      child: Divider(thickness: thickness ?? AppSizes.s_01),
    );
  }
}

class DividerVertical extends StatelessWidget {
  const DividerVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: AppColors.grey, //color of divider
      width: AppSizes.s10,
      thickness: AppSizes.s_05,
      indent: AppSizes.s10,
      endIndent: AppSizes.s10,
    );
  }
}
