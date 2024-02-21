import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../constants/strings.dart';
import '../../../utils/validator.dart';
import '../../resources/values_manager.dart';
import '../../styles/text_styles.dart';
import '../../widgets/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.login),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.heyThereAthlete,
                    style: boldTextStyle.copyWith(fontSize: FontSizes.f18),
                  ),
                  const SizedBox(height: AppSize.s12),
                  FormBuilderTextField(
                    name: AppStrings.email,
                    decoration:
                        const InputDecoration(labelText: AppStrings.email),
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator.call,
                  ),
                  FormBuilderTextField(
                    obscureText: true,
                    name: AppStrings.password,
                    decoration:
                        const InputDecoration(labelText: AppStrings.password),
                    keyboardType: TextInputType.text,
                    validator: requiredValidator.call,
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              PrimaryElevatedButton(text: AppStrings.login, onPressed: () {}),
              PrimaryTextButton(
                text: AppStrings.signInWithWhatsAppOTP,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
