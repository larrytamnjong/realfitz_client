import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:realfitzclient/views/pages/dashboard/setting/account_information/profile_information_page.dart';

import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/transitions.dart';
import '../../../../resources/values_manager.dart';

class NameAndProfileIconRow extends StatelessWidget {
  final String name;
  const NameAndProfileIconRow({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.to(
              transition: downToUp,
                  () => const ProfileInformationPage(),
            );
          },
          icon: Icon(
            Ionicons.person_circle,
            color: AppColors.primary,
            size: AppSizes.s60,
          ),
        ),
        Text(
          name,
          style: boldTextStyle.copyWith(fontSize: FontSizes.f20),
        ),

      ],
    );
  }
}
