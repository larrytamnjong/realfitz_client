import 'package:flutter/material.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class AccountStatusContainer extends StatelessWidget {
  const AccountStatusContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 80,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
              color: AppColors.lightGreen,
              // borderRadius: BorderRadius.circular(AppBorderRadius.r5)
          ),

        ),
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p4),
          child: Text(
            AppStrings.accountIsActive,
            style: boldTextStyle,
          ),
        )
      ],
    );
  }
}
