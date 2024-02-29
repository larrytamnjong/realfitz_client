import 'package:flutter/material.dart';

import '../../constants/image_paths.dart';
import '../../constants/strings.dart';
import '../resources/styles/text_styles.dart';
import '../resources/values_manager.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s12),
      child: Column(
        children: [
          Image(
            image: AssetImage(ImagePaths.synchronize),
          ),
          const SizedBox(height: AppSizes.s10),
          Text(
            AppStrings.weCouldNotFindAnythingPullToRefresh,
            style: regularTextStyle.copyWith(fontSize: FontSizes.f15),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.s30),
        ],
      ),
    );
  }
}
