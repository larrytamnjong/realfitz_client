import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:realfitzclient/constants/icon_paths.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/home_item.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/colors_manager.dart';

class HomeItems extends StatefulWidget {
  final String stepsToday;
  final String coinsToday;
  final String caloriesBurned;
  final String kmWalked;
  const HomeItems(
      {super.key,
      required this.stepsToday,
      required this.coinsToday,
      required this.caloriesBurned,
      required this.kmWalked});

  @override
  State<HomeItems> createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HomeItem(
              title: AppStrings.stepsToday,
              value: widget.stepsToday,
              cardColor: AppColors.palePink,
              iconColor: AppColors.black,
              iconPath: IconPaths.shoe,
            ),
            const SizedBox(width: AppSizes.s5),
            HomeItem(
              title: AppStrings.coinsToday,
              value: widget.coinsToday,
              cardColor: AppColors.paleTeal,
              iconColor: AppColors.primary,
              iconPath: IconPaths.coins,
            ),
          ],
        ),
        Row(
          children: [
            HomeItem(
              title: AppStrings.caloriesBurned,
              value: widget.caloriesBurned,
              useImageIcon: false,
              icon: Ionicons.flame,
              cardColor: AppColors.palePrimary,
              iconColor: AppColors.black,
            ),
            const SizedBox(width: AppSizes.s5),
            HomeItem(
              title: AppStrings.kmWalked,
              value: widget.kmWalked,
              useImageIcon: false,
              cardColor: AppColors.paleLime,
              iconColor: AppColors.primary,
              icon: Icons.directions_walk,
            ),
          ],
        ),
      ],
    );
  }
}
