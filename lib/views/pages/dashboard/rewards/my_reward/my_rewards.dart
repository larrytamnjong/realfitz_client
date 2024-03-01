import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/reward/reward_controller.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/error.dart';

import '../../../../../constants/strings.dart';
import '../widgets/reward_card_main.dart';

class MyRewards extends StatefulWidget {
  const MyRewards({super.key});

  @override
  State<MyRewards> createState() => _MyRewardsState();
}

class _MyRewardsState extends State<MyRewards> {
  late RewardController rewardController;
  @override
  void initState() {
    rewardController = Get.put(RewardController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.myRewards),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: FutureBuilder(
          future: rewardController.getUserRedeemedRewards(),
          builder: (context, result) {
            if (result.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (result.hasError || result.data == null) {
              return const ErrorPage();
            }

            return ListView.builder(
              itemCount: result.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return RewardCardMain(
                  reward: result.data![index],
                  sponsor: result.data![index].sponsor!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
