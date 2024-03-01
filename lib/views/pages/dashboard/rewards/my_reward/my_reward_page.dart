import 'package:flutter/material.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../../constants/strings.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(title: AppStrings.myRewards),
      body: Center(
        child: Text(""),
      ),
    );
  }
}
