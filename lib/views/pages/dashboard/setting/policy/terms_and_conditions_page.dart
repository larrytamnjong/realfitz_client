import 'package:flutter/material.dart';
import 'package:realfitzclient/views/pages/dashboard/setting/policy/widgets/term.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../../constants/strings.dart';
import '../../../../resources/values_manager.dart';

class TermsAndConditionPage extends StatelessWidget {
  const TermsAndConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.termsAndConditions),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: ListView(
          children: const [
            Term(
              title: "General",
              text:
                  "We, Realfitz FZE, and our affiliate, subsidiary and parent companies (collectively, “Realfitz”, “us”, “we” or “our”) are excited to provide you with the use of our website, applications, content, and platform (the “Service”). These Terms and Conditions form a legally binding agreement between you and Realfitz in relation to your use of the Service. By using the Service or by registering an account for the Service, you expressly understand and agree to be bound by these Terms and Conditions, our Privacy Policy, any additional guidelines provided, and any future amendments of the above mentioned (collectively, the “Agreement”)",
            ),
            Term(
              title: "Your Use",
              text:
                  "Subscription to the Service is not valid in those jurisdictions where the Service is prohibited by law or by our policies. By using our Service, you represent and warrant that you have the right, authority, and capacity to enter into this Agreement and that you abide by all of the terms and conditions of this Agreement.",
            ),
            Term(
              title: "Services",
              text:
                  "Realfitz shall offer the following services through the Realfitz app, with the objective of facilitating a rewarding and engaging fitness experience",
            ),
            Term(
              title: "Realfitz Coins",
              text:
                  "Realfitz extends the provision of one Realfitz coin to users for every 500 steps completed. These Realfitz coins are eligible for redemption against rewards and jackpots, as cataloged on the Realfitz app’s marketplace.",
            ),
            Term(
              title: "Rewards",
              text:
                  "Realfitz grants its users access to a curated selection of promotional offers and discounts, which are exclusively accessible to Realfitz users, and which are made available by a limited number of select global brands.",
            ),
            Term(
              title: "Jackpots",
              text:
                  "Realfitz hosts jackpots on the app to amplify user engagement and incentivize fitness achievements. The jackpots are conducted in three categories - weekly, monthly, and annual jackpots.",
            ),
            Term(
              title: "Steps Challenges",
              text:
                  "Realfitz organizes and conducts steps challenges, inviting users to partake in these challenges to bolster their motivation. Users are additionally afforded the opportunity to access leaderboards, allowing for friendly competition with fellow participants.",
            ),
            Term(
              title: "In-app Social Feed",
              text:
                  "Realfitz users are encouraged to actively engage with other users on the app through the social feed, thereby enabling the sharing of personal fitness achievements and participation in discussions relating to fitness and general well-being.",
            ),
            Term(
              title: "Privacy",
              text:
                  "The Realfitz Privacy Policy (“Privacy Policy”) serves as an integral part of this Agreement. Please ensure to carefully review and read the Privacy Policy for details relating to the collection, use, and disclosure of your personal information.",
            ),
            Term(
              title: "Changes to the Terms",
              text:
                  "We may, in our sole discretion, edit, modify, add, or remove any part of this Agreement at any time without providing prior notice to you. Please ensure to periodically check our website for any changes to the Agreement. Any modifications to the Agreement shall be effective immediately for all new and existing users. By your continued use of the Service, you explicitly agree to any such changes.",
            ),
            Term(
              title: "Pricing",
              text:
                  "We endeavor to accurately provide all prices on our Service. We reserve the right to refuse or cancel purchases where we provide an incorrect price or provide you with the wrong information. All prices may be changed without providing any prior notice. The prices are per person unless mentioned otherwise.",
            ),
            Term(title: "Payments", text: ""),
            Term(
              title: "General",
              text:
                  "You agree to pay Realfitz for all charges at the agreed-upon prices for any use of the Service by you or other persons using your account, and you authorize Realfitz to charge your chosen payment provider (your “Payment Method“) for the use of the Service.",
            ),
            Term(
              title: "Payment Method",
              text:
                  "Payment for your use of the Service shall be based on your Payment Method and shall be governed by a separate agreement between you and your choice of Payment Method. In the scenario where we do not receive payment from your chosen Payment Method, you explicitly agree to immediately pay all amounts due to Realfitz; otherwise, we reserve the right to suspend or terminate your access to the Service(s).",
            ),
            Term(
              title: "Accuracy of Information",
              text:
                  "You unequivocally agree to inform us in the scenario where your payment method has been canceled, or in the scenario where you have become aware of a potential breach of your Payment Method, or of the unauthorized use or disclosure of your access to the Service.",
            ),
            Term(
              title: "Recurring Billing",
              text:
                  "By agreeing to this Agreement, you accept that you may be charged on a recurring basis, and you accept complete responsibility for all charges. We reserve the right to make periodic charges, without further authorization from you, until you provide prior written notice to us that you have terminated this authorization or wish to change your Payment Method. Such notice shall only be deemed effective upon our confirmation that your Payment Method has been changed.",
            ),
            Term(
              title: "Reaffirmation of Authorization",
              text:
                  "By your non-termination or continued use of the Service, you authorize us to charge your Payment Method. We reserve the right to submit those charges for payment, and you will be responsible for such charges. This does not waive Realfitz’s right to seek payment directly from you. Your charges may be payable in advance, in arrears, per usage, or as otherwise described on the applicable payment screen.",
            ),
            Term(
              title: "Refunds",
              text:
                  "Realfitz does not provide refunds for use of the Service or for subscriptions of our Services. If you terminate your subscription, you may use it until the end of your then-current term; your subscription will not be renewed after your then-current term expires.",
            ),
            Term(
              title: "Free Trials and Other Promotions",
              text:
                  "Any free trial or other promotion must be used within the specified time of the trial. You must choose to terminate your access to the feature or service before the end of the trial period in order to avoid being charged the applicable fee and/or put on a follow-up subscription plan as communicated to you during the signup process to the free trial or promo. If you terminate access prior to the end of the trial period and are inadvertently charged a fee, please contact Realfitz support to have the charges reversed.",
            ),
            Term(
              title: "Account Security",
              text:
                  "You are responsible for maintaining the confidentiality of the username and password that you use to register for and use the Service. You agree to (a) immediately notify Realfitz of any unauthorized use of your username or password or any other breach of security, and (b) ensure that you exit from your account at the end of each session. Realfitz will not be liable for any loss or damage arising from your failure to comply with this provision. We shall endeavor to keep a high level of security of all our data; however, in the scenario where the data held by Realfitz is stolen and/or leaked, we shall not be held liable in any way or form. You should use caution when accessing your account from a public or shared computer so that others are not able to view or record your password or other personal information. You may not share your account with any other person.",
            ),
            Term(
              title: "Usage Data",
              text:
                  "We are gathering fitness data from our app globally, and we are sharing it with governments and private companies. By using our app, you agree to renounce any rights to the data they generate unless we contact you with a new agreement.",
            ),
            Term(
              title: "Proprietary Rights",
              text:
                  "Realfitz, and its licensors, own and retain all proprietary rights in the Service. The Service contains content, visual interfaces, interactive features, information, graphics, design, compilation, computer code, products, software, services, and other elements of the Service (the “Realfitz Materials”) that are protected by copyright, trade dress, patent, and trademark laws, international conventions, and other relevant intellectual property and proprietary rights, and applicable laws.",
            ),
          ],
        ),
      ),
    );
  }
}
