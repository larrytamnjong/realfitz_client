import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/available/available_challenges.dart';
import 'package:realfitzclient/views/pages/dashboard/challenge/history/challenge_history.dart';
import 'package:realfitzclient/views/resources/styles/text_styles.dart';

import '../../../../constants/strings.dart';
import '../../../../controllers/challenge/challenge_controller.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/values_manager.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> with TickerProviderStateMixin{
  late ChallengeController controller;
  late TabController tabController;
  @override
  void initState() {
    controller = Get.put(ChallengeController());
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:
              Center(child: Text(AppStrings.challenge, style: appBarTextStyle)),
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
                                  controller.getChallengesByCategoryId();
                                  controller.update();
                                }else{
                                  controller.getChallengeHistoriesById();
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
                  controller: tabController,
                  labelColor: AppColors.primary,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 2,
                  tabAlignment: TabAlignment.fill,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: <Widget>[
                    Tab(text: AppStrings.available),
                    Tab(text: AppStrings.history),
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
            Center(child: AvailableChallenges()),
            Center(child: ChallengeHistory()),
          ],
        ),
      ),
    );
  }
}
