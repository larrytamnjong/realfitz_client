import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 25,
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppBorderRadius.r50),
                          bottomRight: Radius.circular(AppBorderRadius.r20),
                          bottomLeft: Radius.circular(AppBorderRadius.r20),
                        )),
                    child: HomeItem(
                      title: AppStrings.stepsToday,
                      value: widget.stepsToday,
                      cardColor: AppColors.darkWhite,
                      // iconColor: AppColors.black,
                      iconPath: IconPaths.shoe,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        color: AppColors.lightCream,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppBorderRadius.r20),
                        )),
                    child: HomeItem(
                      title: AppStrings.distance,
                      value: widget.kmWalked,
                      cardColor: AppColors.darkGrass,
                      iconColor: AppColors.black,
                      iconPath: IconPaths.run,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        Expanded(
            flex: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                          color: AppColors.lightCream,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(AppBorderRadius.r20),
                          )),
                      child: HomeItem(
                        title: AppStrings.caloriesBurned,
                        value: widget.caloriesBurned,
                        useImageIcon: false,
                        icon: Ionicons.flame,
                        cardColor: AppColors.lightGrass,
                        iconColor: AppColors.black,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                        color: AppColors.lightCream,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(AppBorderRadius.r20),
                          bottomRight: Radius.circular(AppBorderRadius.r50),
                          topLeft: Radius.circular(AppBorderRadius.r20),
                        )),
                    child: HomeItem(
                      title: AppStrings.coinsToday,
                      value: widget.coinsToday,
                      cardColor: AppColors.lightCream,
                      iconColor: AppColors.black,
                      iconPath: IconPaths.coin,
                    ),
                  ),
                ),
              ],
            ))
      ],
    );

    /* Column(
      children: [
        Row(
          children: [
            HomeItem(
              title: AppStrings.stepsToday,
              value: widget.stepsToday,
              cardColor: AppColors.lightOrange,
              // iconColor: AppColors.black,
              iconPath: IconPaths.shoe,
            ),
            const SizedBox(width: AppSizes.s5),
            HomeItem(
              title: AppStrings.caloriesBurned,
              value: widget.caloriesBurned,
              useImageIcon: false,
              icon: Ionicons.flame,
              cardColor: AppColors.lightGrass,
              iconColor: AppColors.black,
            ),

          ],
        ),
        Row(
          children: [
            HomeItem(
              title: AppStrings.coinsToday,
              value: widget.coinsToday,
              cardColor: AppColors.lightCream,
              iconColor: AppColors.black,
              iconPath: IconPaths.coin,
            ),
            const SizedBox(width: AppSizes.s5),
            HomeItem(
              title: AppStrings.distance,
              value: widget.kmWalked,

              cardColor: AppColors.darkGrass,
              iconColor: AppColors.black,
              iconPath: IconPaths.run,
            ),
          ],
        ),
      ],
    );*/
  }
}
