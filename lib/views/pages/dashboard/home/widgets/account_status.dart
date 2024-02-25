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
    return Container(
      height: AppSizes.s23,
      width: 150,
      decoration: BoxDecoration(
          color: AppColors.lightGreen.withOpacity(0.4),
          borderRadius: BorderRadius.circular(AppBorderRadius.r5)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: AppPadding.p4),
          child: Text(
            AppStrings.accountIsActive,
            style: boldTextStyle,
          ),
        ),
      ),
    );
  }
}
