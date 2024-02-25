import 'package:flutter/material.dart';

import '../resources/values_manager.dart';

class BottomAppBarIcon extends StatelessWidget {
  final double? size;
  final String iconPath;
  const BottomAppBarIcon({
    super.key,
    required this.iconPath,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(iconPath),
      size: size ?? AppSizes.s30,
    );
  }
}
