import 'package:flutter/material.dart';
import 'package:realfitzclient/constants/strings.dart';

import '../../../../../constants/icon_paths.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../styles/text_styles.dart';

class AccountBalance extends StatelessWidget {
  final String accountBalance;
  const AccountBalance({
    super.key,
    required this.accountBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          AssetImage(IconPaths.coins),
          color: AppColors.primary,
        ),
        const SizedBox(width: AppSizes.s5),
        Text(
          accountBalance,
          style: boldTextStyle.copyWith(fontSize: FontSizes.f20),
        ),
        const SizedBox(width: AppSizes.s10),
        Text(
          AppStrings.rfc,
          style: boldTextStyle.copyWith(
              fontSize: FontSizes.f21, color: AppColors.green),
          textAlign: TextAlign.end,
        )
      ],
    );
  }
}
