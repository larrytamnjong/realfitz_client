import 'package:flutter/material.dart';
import 'package:realfitzclient/views/pages/dashboard/setting/policy/widgets/term.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../../constants/strings.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.privacyPolicy),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: ListView(
          children: const [
            Term(
              title: "General",
              text:
                  "Realfitz  (\"Realfitz,\" \"we,\" \"us,\" or \"our\") is committed to protecting the privacy of its users. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our website, applications, content, and platform (collectively, the \"Service\"). Please read this Privacy Policy carefully. By accessing or using the Service, you agree to be bound by this Privacy Policy.",
            ),
            Term(
              title: "Information We Collect",
              text:
                  "We may collect personal information from you when you use our Service, including but not limited to: \n- Contact information such as name, email address, and phone number\n- Payment information\n- Fitness and activity data collected through the Realfitz app\n- User-generated content such as posts and comments on the social feed",
            ),
            Term(
              title: "How We Use Your Information",
              text:
                  "We may use the information we collect from you for various purposes, including but not limited to:\n- Providing and maintaining the Service\n- Personalizing your experience\n- Processing transactions\n- Communicating with you\n- Analyzing usage of the Service\n- Offering promotions and rewards",
            ),
            Term(
              title: "Sharing Your Information",
              text:
                  "We may share your information with third parties under certain circumstances, including:\n- Service providers who assist us in operating the Service\n- Business partners for joint promotions or offerings\n- Government authorities or law enforcement agencies when required by law,",
            ),
            Term(
              title: "Data Security",
              text:
                  "We take reasonable measures to protect your information from unauthorized access, use, alteration, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.",
            ),
            Term(
              title: "Changes to This Privacy Policy",
              text:
                  "We may update our Privacy Policy from time to time. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.",
            ),
            Term(
              title: "Contact Us",
              text:
                  "If you have any questions or concerns about this Privacy Policy, please contact us at :contact@realfitz.com",
            )
          ],
        ),
      ),
    );
  }
}
