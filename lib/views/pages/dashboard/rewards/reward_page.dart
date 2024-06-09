import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/reward/reward_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/all_rewards/all_rewards.dart';
import 'package:realfitzclient/views/pages/dashboard/rewards/my_reward/my_rewards.dart';
import 'package:realfitzclient/views/resources/colors_manager.dart';

import '../../../../constants/strings.dart';
import '../../../resources/styles/text_styles.dart';
import '../../../resources/values_manager.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with TickerProviderStateMixin{
  late RewardController controller;
  late TabController tabController;

  @override
  void initState() {
    controller = Get.put(RewardController());
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(AppStrings.reward, style: appBarTextStyle)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Column(
              children: [
                FutureBuilder(
                  future: controller.getAllCategories(),
                  builder: (context, result) {
                    if (result.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (result.hasError || result.data == null) {
                      return Text(result.data.toString());
                    }

                    return Container(
                      height: 35,
                      child: Obx(
                            () => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: AppPadding.p20,
                          ),
                          itemCount: controller.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                controller.selectedCategoryChallenge.value =
                                controller.categories[index];

                                if(tabController.index==0){
                                  controller.getAllRewards();
                                  controller.update();
                                }else{
                                  print("gryuidyfhiu");
                                  controller.getUserRedeemedRewards();
                                  controller.update();
                                }
                                controller.update();

                              },
                              child: Obx(()=>
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:Get.width *0.03),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.width *0.04),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:  controller.selectedCategoryChallenge.value ==
                                                      controller.categories[index]?AppColors.black:AppColors.white))),
                                      child: Text(
                                        controller.categories[index].name
                                            .toString(),
                                        style: mediumTextStyle,
                                      )),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                TabBar(
                  labelColor: AppColors.primary,
                  controller: tabController,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 2,
                  tabAlignment: TabAlignment.fill,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: <Widget>[
                    const Tab(text: AppStrings.allRewards),
                    const Tab(text: AppStrings.myRewards),
                  ],
                ),
              ],
            ),
          ),
        ),
        //
        body:  TabBarView(
          controller: tabController,
          children: <Widget>[
            Center(child: AllRewardsPage()),
            Center(child: MyRewardsPage()),
          ],
        ),
      ),
    );
  }
}
