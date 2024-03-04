import 'package:flutter/material.dart';
import 'package:realfitzclient/views/pages/dashboard/home/widgets/vertical_text_icon_button.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/values_manager.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VerticalTextWithIconButton(
          icon: Icons.history,
          text: AppStrings.history,
          onPressed: () {},
        ),
        const SizedBox(width: AppSizes.s5),
        VerticalTextWithIconButton(
          icon: Icons.arrow_outward_rounded,
          text: AppStrings.withdrawal,
          onPressed: () {},
        ),
        const SizedBox(width: AppSizes.s5),
        VerticalTextWithIconButton(
          icon: Icons.arrow_downward,
          text: AppStrings.deposit,
          onPressed: () {},
        ),
      ],
    );
  }
}
