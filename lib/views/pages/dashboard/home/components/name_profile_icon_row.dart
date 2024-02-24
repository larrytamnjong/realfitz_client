import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../styles/text_styles.dart';

class NameAndProfileIconRow extends StatelessWidget {
  final String name;
  const NameAndProfileIconRow({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: boldTextStyle.copyWith(fontSize: FontSizes.f20),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Ionicons.person_circle,
            color: AppColors.primary,
            size: AppSizes.s50,
          ),
        )
      ],
    );
  }
}
