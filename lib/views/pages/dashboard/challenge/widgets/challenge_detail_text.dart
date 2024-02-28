import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';
import 'package:realfitzclient/views/widgets/divider.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class ChallengeDetailText extends StatelessWidget {
  final String detail;
  const ChallengeDetailText({
    super.key,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    var showMore = false.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DividerHorizontal(
          thickness: AppSizes.s_05,
          padding: AppPadding.p0,
        ),
        Card(
          color: AppColors.paleLime,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.details,
                    style: boldTextStyle.copyWith(
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    detail,
                    style: regularTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: showMore.value ? TextLines.l20 : TextLines.l6,
                  ),
                  PrimaryTextButton(
                    onPressed: () {
                      showMore.value = !showMore.value;
                    },
                    text: showMore.value
                        ? AppStrings.showLess
                        : AppStrings.showMore,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
