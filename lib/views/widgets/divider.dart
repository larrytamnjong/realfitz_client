import 'package:flutter/material.dart';

import '../resources/values_manager.dart';

class LineDivider extends StatelessWidget {
  final double? padding;
  final double? thickness;
  const LineDivider({
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
