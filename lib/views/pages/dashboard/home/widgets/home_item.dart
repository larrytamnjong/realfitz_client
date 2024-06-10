import 'package:count_number/count_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/styles/text_styles.dart';

class HomeItem extends StatefulWidget {
  final String? iconPath;
  final String title;
  final String value;
  // final Color cardColor;
  final Color? iconColor;
  final bool useImageIcon;
  final IconData? icon;

  const HomeItem({
    super.key,
    this.iconPath,
    required this.title,
    required this.value,
    // required this.cardColor,
    this.iconColor,
    this.useImageIcon = true,
    this.icon,
  });

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  var count = 0.obs;
  late CountNumber countNumber;

  @override
  void initState() {
    super.initState();
    countNumber = CountNumber(
      endValue: int.parse(widget.value),
      onUpdate: (value) {
        count.value = value as int;
      },
    );
  }

  @override
  void dispose() {
    countNumber.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    countNumber.start();
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   widget.title.toUpperCase(),
          //   style: regularTextStyle.copyWith(
          //     fontSize: FontSizes.f18,
          //   ),
          // ),
          Center(
            child: widget.useImageIcon
                ? ImageIcon(
              AssetImage(widget.iconPath ?? ''),
              size: AppSizes.s60,
              // color: widget.iconColor,
            )
                : Icon(
              widget.icon,
              size: AppSizes.s60,
              // color: widget.iconColor,
            ),
          ),
          SizedBox(height: AppSizes.s20,),
          Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  count.value.toString(),
                  style: boldTextStyle.copyWith(fontSize: FontSizes.f25),
                ),
                Text(
                  widget.title == AppStrings.caloriesBurned
                      ? " cal"
                      : widget.title == AppStrings.distance
                      ? " km"
                      :  widget.title == AppStrings.steps?" steps":" RFC",
                  style: regularTextStyle.copyWith(fontSize: FontSizes.f18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
