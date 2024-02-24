import 'package:flutter/material.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/values_manager.dart';
import 'account_balance.dart';
import 'account_status.dart';
import 'column_button.dart';
import 'name_profile.dart';

class AccountSummary extends StatelessWidget {
  const AccountSummary({
    super.key,
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
                const NameAndProfileIconRow(
                  name: '#Tamnjong',
                ),
                const AccountStatusContainer(),
                const SizedBox(height: AppSizes.s5),
                const AccountBalance(
                  accountBalance: '2000.00',
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
