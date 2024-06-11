import 'package:flutter/material.dart';
import 'package:realfitzclient/constants/strings.dart';

import '../../../../../constants/icon_paths.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

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
        Image.asset(IconPaths.coins,height: 25,width: 25,)
        /*ImageIcon(
          AssetImage(IconPaths.coins),
          // color: AppColors.primary,
        )*/,
        const SizedBox(width: AppSizes.s5),
        Text(
          accountBalance,
          style: boldTextStyle.copyWith(fontSize: FontSizes.f18),
        ),
        const SizedBox(width: AppSizes.s10),
        Text(
          AppStrings.rfc,
          style: boldTextStyle.copyWith(
              fontSize: FontSizes.f18, color: AppColors.green),
          textAlign: TextAlign.end,
        ),
        const SizedBox(width: AppSizes.s5),
      ],
    );
  }
}
