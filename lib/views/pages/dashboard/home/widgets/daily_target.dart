import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/controllers/home/home_page_controller.dart';
import 'package:realfitzclient/utils/get_percentage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../../constants/icon_paths.dart';
import '../../../../../constants/strings.dart';
import '../../../../../utils/validators.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';
import '../../challenge/widgets/linear_progress_indicator.dart';
import 'horizontal_text_icon_button.dart';

class DailyTarget extends StatelessWidget {
  final String percent;
  final String stepsTaken;
  final String steps;
  const DailyTarget({
    super.key,
    required this.percent,
    required this.stepsTaken,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalTextIconButton(
          icon: ImageIcon(
            AssetImage(IconPaths.edit),
            size: AppSizes.s20,
            color: AppColors.primary,
          ),
          text: AppStrings.dailyStepTarget,
          onPressed: () => _updateStepTarget(context),
        ),
        LinearPercentageIndicator(
          negativeWidth: 55,
          percent: getPercentageOnTen(percent),
          stepsTaken: stepsTaken,

          steps: steps,
        ),
      ],
    );
  }

  _updateStepTarget(context) {
    HomePageController controller = Get.find<HomePageController>();
    Alert(
      context: context,
      title: AppStrings.stepTarget,
      content: controller.isShowingLoadingIndicator.value
          ? const CircularProgressIndicator()
          : FormBuilder(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(

                      name: AppStrings.stepTarget,
                      decoration: InputDecoration(
                        helperText: AppStrings.enterYourDailyStepTarget,
                        helperStyle: regularTextStyle,
                        hintStyle: regularTextStyle,
                        labelText: AppStrings.stepTarget,
                      ),
                      keyboardType: TextInputType.number,
                      validator: requiredValidator.call,
                      controller: controller.targetController,
                    )
                  ],
                ),
              ),
            ),
      buttons: [
        DialogButton(
          color: AppColors.primary,
          onPressed: () async {
            await controller.updateUserStepTarget();
          },
          child: Text(AppStrings.save, style: mediumTextStyle),
        )
      ],
    ).show();
  }
}
