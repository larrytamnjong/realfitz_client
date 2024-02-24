import 'package:flutter/material.dart';
import 'package:realfitzclient/constants/icon_paths.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import 'components/account_summary_card.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(AppPadding.p8),
        child: AccountSummaryCard(),
      ),
    );
  }
}
