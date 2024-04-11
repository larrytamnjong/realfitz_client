import 'package:flutter/material.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.faqs),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: ListView(
          children: [
            EasyFaq(
              question: "What is RealFitz?",
              answer:
                  "RealFitz is a walk and earn rewards app where you get rewarded for taking steps daily.",
            ),
            const SizedBox(height: AppSizes.s10),
            EasyFaq(
              question: "How do I join a contest?",
              answer:
                  "Visit the challenge page and click on which ever challenge you want to be a part of.",
            ),
            const SizedBox(height: AppSizes.s10),
            EasyFaq(
              question: "How do I redeem my rewards?",
              answer: "You can redeem rewards on the rewards page.",
            ),
            const SizedBox(height: AppSizes.s10),
            EasyFaq(
              question: "Who organises contest?",
              answer: "Different companies sponsor challenges on RealFitz.",
            ),
            const SizedBox(height: AppSizes.s10),
            EasyFaq(
              question: "Can I earn real money?",
              answer: "The simple answer is no.",
            ),
          ],
        ),
      ),
    );
  }
}
