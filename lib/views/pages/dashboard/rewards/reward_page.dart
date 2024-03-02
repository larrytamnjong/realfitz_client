import 'package:flutter/material.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/all_rewards/all_rewards.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/my_reward/my_rewards.dart';

import '../../../../constants/strings.dart';
import '../../../resources/styles/text_styles.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.reward, style: appBarTextStyle),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: AppStrings.allRewards),
              Tab(text: AppStrings.myRewards),
            ],
          ),
        ),
        //
        body: const TabBarView(
          children: <Widget>[
            Center(child: AllRewardsPage()),
            Center(child: MyRewardsPage()),
          ],
        ),
      ),
    );
  }
}
