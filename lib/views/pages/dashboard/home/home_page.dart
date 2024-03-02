import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/icon_paths.dart';
import 'package:realfitzclient/controllers/home/home_page_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/doughnut_graph.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/home_items.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/error.dart';

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
        appBar: AppBarWithAppName(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.p8),
              child: IconButton(
                onPressed: () {},
                icon: Badge(
                  isLabelVisible: false,
                  label: const Text(''),
                  child: ImageIcon(
                    AssetImage(IconPaths.notification),
                    size: AppSizes.s26,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder<HomePageData?>(
          future: homePageController.getHomePageData(),
          builder: (context, result) {
            if (result.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (result.hasError || result.data == null) {
              return const ErrorPage();
            }
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountSummary(
                      name: result.data!.name!,
                      accountBalance: result.data!.accountBalance ?? '0',
                    ),
                    const SizedBox(height: AppSizes.s2),
                    HomeItems(
                      stepsToday: result.data!.stepsToday!,
                      coinsToday: result.data!.coinsToday!,
                    ),
                    const SizedBox(height: AppSizes.s2),
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
