import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/reward/reward_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/widgets/reward_card_summary.dart';

import '../../../../resources/values_manager.dart';
import '../../../../widgets/error.dart';

class AllRewardsPage extends StatefulWidget {
  const AllRewardsPage({super.key});

  @override
  State<AllRewardsPage> createState() => _AllRewardsPageState();
}

class _AllRewardsPageState extends State<AllRewardsPage> {
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
          onRefresh: rewardController.getAllRewards,
          child: FutureBuilder(
            future: rewardController.getAllRewards(),
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
                  return RewardCardSummary(
                    showRandomColor: true,
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
