import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realfitzclient/constants/image_paths.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/views/resources/styles/text_styles.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';

class FatalError extends StatelessWidget {
  final String errorMessage;

  const FatalError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    BaseController baseController = Get.put(BaseController());
    return Scaffold(
      appBar: const MainAppBar(
        title: AppStrings.error,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          children: [
            Image(
              image: AssetImage(ImagePaths.warning),
            ),
            const SizedBox(height: AppSizes.s10),
            Text(
              errorMessage,
              style: regularTextStyle.copyWith(fontSize: FontSizes.f15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.s30),
            PrimaryElevatedButton(
              text: AppStrings.exit,
              onPressed: () {
                baseController.exitApp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
