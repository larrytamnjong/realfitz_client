import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:realfitzclient/controllers/onboarding/authentication_controller.dart';
import 'package:realfitzclient/controllers/setting/settings_controller.dart';
import 'package:realfitzclient/utils/launch_url.dart';
import 'package:realfitzclient/views/pages/dashboard/setting/general/faq_page.dart';
import 'package:realfitzclient/views/pages/dashboard/setting/policy/privacy_policy_page.dart';
import 'package:realfitzclient/views/pages/dashboard/setting/policy/terms_and_conditions_page.dart';
import 'package:realfitzclient/views/resources/styles/text_styles.dart';
import 'package:realfitzclient/views/resources/transitions.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../constants/strings.dart';
import '../../../resources/colors_manager.dart';
import '../../../widgets/buttons.dart';
import '../../onboarding/authentication/permission_page.dart';
import 'account_information/profile_information_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late AuthenticationController authenticationController;
  late SettingsController settingsController;
  @override
  void initState() {
    authenticationController = Get.put(AuthenticationController());
    settingsController = Get.put(SettingsController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.settings),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: ModalProgressHUD(
          inAsyncCall: settingsController.isShowingLoadingIndicator.value,
          progressIndicator: const CircularProgressIndicator(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    OutlineTileButton(
                      text: AppStrings.permission,
                      icon: Icons.security_rounded,
                      onTap: () {
                        Get.to(
                            transition: rightToLeft,
                            () => const PermissionPage());
                      },
                    ),
                    OutlineTileButton(
                      text: AppStrings.accountInformation,
                      icon: Ionicons.person,
                      onTap: () {
                        Get.to(
                          transition: rightToLeft,
                          () => const ProfileInformationPage(),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Text(AppStrings.general,
                          style:
                              boldTextStyle.copyWith(fontSize: FontSizes.f15)),
                    ),
                    OutlineTileButton(
                      showTrailing: false,
                      text: AppStrings.faqs,
                      icon: Icons.question_mark_outlined,
                      onTap: () {
                        Get.to(() => const FaqPage(), transition: rightToLeft);
                      },
                    ),
                    OutlineTileButton(
                      showTrailing: false,
                      text: AppStrings.privacyPolicy,
                      icon: Icons.policy,
                      onTap: () {
                        Get.to(() => const PrivacyPolicyPage(),
                            transition: rightToLeft);
                      },
                    ),
                    OutlineTileButton(
                      showTrailing: false,
                      text: AppStrings.termsAndConditions,
                      icon: Icons.receipt,
                      onTap: () {
                        Get.to(() => const TermsAndConditionPage(),
                            transition: rightToLeft);
                      },
                    ),
                    OutlineTileButton(
                      showTrailing: false,
                      text: AppStrings.liveSupportOrRequestAccountDeletion,
                      icon: Ionicons.logo_whatsapp,
                      onTap: () async {
                        await settingsController.getWhatsAppSupportNumber();
                        if (settingsController.whatsAppSupportNumber != null) {
                          launchExternalUrl(
                            urlString:
                                'https://wa.me/${settingsController.whatsAppSupportNumber}?text=What would you like to do today?',
                          );
                        }
                      },
                    ),
                    OutlineTileButton(
                      showTrailing: false,
                      text: AppStrings.suggestion,
                      icon: Ionicons.bulb_outline,
                      onTap: () async {
                        await settingsController.getWhatsAppSupportNumber();
                        if (settingsController.whatsAppSupportNumber != null) {
                          launchExternalUrl(
                            urlString:
                                'https://wa.me/${settingsController.whatsAppSupportNumber}?text=Go right ahead and let us know what your suggestion is!',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              PrimaryTextButton(
                color: AppColors.red,
                onPressed: () async {
                  await authenticationController.logout();
                },
                fontSize: FontSizes.f20,
                text: AppStrings.logOut,
              )
            ],
          ),
        ),
      ),
    );
  }
}
