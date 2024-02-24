import 'package:flutter/material.dart';

import '../../../../../constants/icon_paths.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../../styles/text_styles.dart';

class AccountBalanceRow extends StatelessWidget {
  final String accountBalance;
  const AccountBalanceRow({
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
        Text(accountBalance,
            style: boldTextStyle.copyWith(fontSize: FontSizes.f20)),
      ],
    );
  }
}
