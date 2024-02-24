import 'package:count_number/count_number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../../styles/text_styles.dart';

class HomeItem extends StatefulWidget {
  final String iconPath;
  final String title;
  final String value;
  final Color cardColor;
  final Color iconColor;
  const HomeItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
    required this.cardColor,
    required this.iconColor,
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
    return Expanded(
      child: Card(
        color: widget.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: ImageIcon(
                  AssetImage(widget.iconPath),
                  size: AppSizes.s45,
                  color: widget.iconColor,
                ),
              ),
              Text(
                widget.title,
                style: regularTextStyle.copyWith(
                  fontSize: FontSizes.f15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p4),
                child: Obx(
                  () => Text(
                    count.value.toString(),
                    style: boldTextStyle.copyWith(fontSize: FontSizes.f18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
