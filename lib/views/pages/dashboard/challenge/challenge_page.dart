import 'package:flutter/material.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/available/available_challenges.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/history/challenge_history.dart';
import 'package:realfitzclient/views/resources/styles/text_styles.dart';

import '../../../../constants/strings.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.challenge, style: appBarTextStyle),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: AppStrings.available),
              Tab(text: AppStrings.history),
            ],
          ),
        ),
        //
        body: const TabBarView(
          children: <Widget>[
            Center(child: AvailableChallenges()),
            Center(child: ChallengeHistory()),
          ],
        ),
      ),
    );
  }
}
