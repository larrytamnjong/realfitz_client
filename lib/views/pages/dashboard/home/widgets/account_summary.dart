import 'package:flutter/material.dart';
import 'package:realfitzclient/utils/amount_formatter.dart';
import 'package:realfitzclient/utils/get_first_name.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/values_manager.dart';
import 'account_balance.dart';
import 'account_status.dart';
import 'column_button.dart';
import 'name_profile.dart';

class AccountSummary extends StatelessWidget {
  final String name;
  final String accountBalance;
  const AccountSummary({
    super.key,
    required this.name,
    required this.accountBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p10, horizontal: AppPadding.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameAndProfileIconRow(
                  name: getFirstNameFromNames(name),
                ),
                const AccountStatusContainer(),
                const SizedBox(height: AppSizes.s5),
                AccountBalance(
                  accountBalance: formatAmount(accountBalance),
                ),
                const SizedBox(height: AppSizes.s10),
                Row(
                  children: [
                    VerticalTextButton(
                      icon: Icons.history,
                      text: AppStrings.history,
                      onPressed: () {},
                    ),
                    const SizedBox(width: AppSizes.s5),
                    VerticalTextButton(
                      icon: Icons.arrow_outward_rounded,
                      text: AppStrings.withdrawal,
                      onPressed: () {},
                    ),
                    const SizedBox(width: AppSizes.s5),
                    VerticalTextButton(
                      icon: Icons.arrow_downward,
                      text: AppStrings.deposit,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
