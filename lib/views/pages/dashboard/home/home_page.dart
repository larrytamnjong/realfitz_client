import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/home/home_page_controller.dart';
import 'package:realfitzclient/utils/coin_value_exchange.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/account_status.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/carousel_images.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/doughnut_graph.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/home_items.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/error.dart';

import '../../../../constants/strings.dart';
import '../../../../models/home/home_page_data.dart';
import 'widgets/account_summary.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Scaffold(
        appBar: const MainAppBar(
          title: AppStrings.appName,
          actions: [
            AccountStatusContainer(),
          ],
          isCenter: true,
          isLeading: false,
        ) /*const AppBarWithAppName(
          actions: [
            // Padding(
            //   padding: const EdgeInsets.only(right: AppPadding.p8),
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: Badge(
            //       isLabelVisible: false,
            //       label: const Text(''),
            //       child: ImageIcon(
            //         AssetImage(IconPaths.notification),
            //         size: AppSizes.s26,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        )*/
        ,
        body: FutureBuilder<HomePageData?>(
          future: homePageController.getHomePageData(),
          builder: (context, result) {
            if (result.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (result.hasError || result.data == null) {
              return const ErrorPage();
            }
            var data = result.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15,vertical: AppPadding.p8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountSummary(
                      name: data.name!,
                      accountBalance: data.accountBalance ?? '0',
                      stepsTaken: data.stepsToday!,
                      steps: data.stepTarget!.target!,
                    ),
                    const SizedBox(height: AppSizes.s18),
                    ImageCarousel(
                      images: data.adImages,
                    ),
                    const SizedBox(height: AppSizes.s18),
                    HomeItems(
                      stepsToday: data.stepsToday!,
                      coinsToday: getCoinsValueFromSteps(data.coinsToday),
                      caloriesBurned: data.caloriesBurned!,
                      kmWalked: data.kmWalked!,
                    ),
                    const SizedBox(height: AppSizes.s18),
                    DoughnutGraph(
                      data: result.data!.doughnutChartData,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      onRefresh: () => homePageController.getHomePageData(),
    );
  }
}
