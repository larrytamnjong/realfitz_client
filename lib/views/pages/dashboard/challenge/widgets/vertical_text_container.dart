import 'package:flutter/material.dart';

import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';

class VerticalTextContainer extends StatelessWidget {
  final String topText;
  final String bottomText;
  const VerticalTextContainer({
    super.key,
    required this.topText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppSizes.s70,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                topText,
                style: regularTextStyle.copyWith(fontSize: FontSizes.f13),
              ),
              Text(bottomText,
                  style: boldTextStyle.copyWith(fontSize: FontSizes.f15))
            ],
          ),
        ),
      ),
    );
  }
}
