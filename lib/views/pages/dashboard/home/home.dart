import 'package:flutter/material.dart';
import 'package:realfitzclient/constants/icon_paths.dart';
import 'package:realfitzclient/models/step/chart_data.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/doughnut_graph.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/home_items.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import 'widgets/account_summary.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AccountSummary(),
              const SizedBox(height: AppSizes.s2),
              const HomeItems(),
              const SizedBox(height: AppSizes.s2),
              DoughnutGraph(data: <DoughnutData>[
                DoughnutData("1", 100),
                DoughnutData("2", 100),
                DoughnutData("3", 100),
                DoughnutData("4", 100),
                DoughnutData("5", 100)
              ])
            ],
          ),
        ),
      ),
    );
  }
}
