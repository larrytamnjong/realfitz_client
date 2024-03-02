import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:realfitzclient/controllers/onboarding/authentication_controller.dart';
import 'package:realfitzclient/views/resources/styles/text_styles.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../constants/strings.dart';
import '../../../widgets/buttons.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late AuthenticationController authenticationController;
  @override
  void initState() {
    authenticationController = Get.put(AuthenticationController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.settings),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  OutlineTileButton(
                    text: AppStrings.permission,
                    icon: Icons.security_rounded,
                    onTap: () {},
                  ),
                  OutlineTileButton(
                    text: AppStrings.accountInformation,
                    icon: Ionicons.person,
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Text(AppStrings.general,
                        style: boldTextStyle.copyWith(fontSize: FontSizes.f15)),
                  ),
                  OutlineTileButton(
                    showTrailing: false,
                    text: AppStrings.faqs,
                    icon: Icons.question_mark_outlined,
                    onTap: () {},
                  ),
                  OutlineTileButton(
                    showTrailing: false,
                    text: AppStrings.privacyPolicy,
                    icon: Icons.policy,
                    onTap: () {},
                  ),
                  OutlineTileButton(
                    showTrailing: false,
                    text: AppStrings.termsAndConditions,
                    icon: Icons.receipt,
                    onTap: () {},
                  ),
                  OutlineTileButton(
                    showTrailing: false,
                    text: AppStrings.liveSupport,
                    icon: Ionicons.logo_whatsapp,
                    onTap: () {},
                  ),
                  OutlineTileButton(
                    showTrailing: false,
                    text: AppStrings.suggestion,
                    icon: Ionicons.bulb_outline,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            PrimaryTextButton(
              onPressed: () async {
                await authenticationController.logout();
              },
              fontSize: FontSizes.f20,
              text: AppStrings.logOut,
            )
          ],
        ),
      ),
    );
  }
}
