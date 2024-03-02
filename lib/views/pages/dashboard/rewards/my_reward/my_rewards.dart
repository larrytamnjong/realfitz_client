import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/reward/reward_controller.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/error.dart';

import '../widgets/reward_card_main.dart';

class MyRewardsPage extends StatefulWidget {
  const MyRewardsPage({super.key});

  @override
  State<MyRewardsPage> createState() => _MyRewardsPageState();
}

class _MyRewardsPageState extends State<MyRewardsPage> {
  late RewardController rewardController;
  @override
  void initState() {
    rewardController = Get.put(RewardController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: RefreshIndicator(
          onRefresh: rewardController.getUserRedeemedRewards,
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
      ),
    );
  }
}
