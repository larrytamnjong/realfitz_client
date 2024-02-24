import 'package:flutter/material.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/values_manager.dart';
import 'account_balance_row.dart';
import 'account_status_container.dart';
import 'column_button.dart';
import 'name_profile_icon_row.dart';

class AccountSummaryCard extends StatelessWidget {
  const AccountSummaryCard({
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
                const AccountBalanceRow(
                  accountBalance: '2000',
                ),
                const SizedBox(height: AppSizes.s10),
                Row(
                  children: [
                    ColumnButton(
                      icon: Icons.history,
                      text: AppStrings.history,
                      onPressed: () {},
                    ),
                    const SizedBox(width: AppSizes.s5),
                    ColumnButton(
                      icon: Icons.arrow_outward_rounded,
                      text: AppStrings.withdrawal,
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
