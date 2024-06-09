import 'package:flutter/material.dart';
import 'package:realfitzclient/utils/amount_formatter.dart';
import 'package:realfitzclient/utils/get_first_name.dart';
import 'package:realfitzclient/utils/get_percentage.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';

import '../../../../resources/values_manager.dart';
import 'account_balance.dart';
import 'account_status.dart';
import 'daily_target.dart';
import 'name_profile.dart';

class AccountSummary extends StatelessWidget {
  final String name;
  final String accountBalance;
  final String stepsTaken;
  final String steps;

  const AccountSummary({
    super.key,
    required this.name,
    required this.accountBalance,
    required this.stepsTaken,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary.withOpacity(0.05),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p10, horizontal: AppPadding.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NameAndProfileIconRow(
                      name: getFirstNameFromNames(name),
                    ),
                    AccountBalance(
                      accountBalance: formatAmount(accountBalance),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.s10),
                DailyTarget(
                  percent: calculatePercentage(stepsTaken, steps),
                  stepsTaken: stepsTaken,
                  steps: steps,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
