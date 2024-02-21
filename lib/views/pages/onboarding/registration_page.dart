import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/utils/validator.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/styles/text_styles.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';
import 'package:realfitzclient/views/widgets/phone_code_picker.dart';

import '../../widgets/appbar.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: AppStrings.createAccount,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s10),
                  Text(
                    AppStrings.heyThereAthlete,
                    style: boldTextStyle.copyWith(fontSize: FontSizes.f18),
                  ),
                  const SizedBox(height: AppSize.s12),
                  PhoneCodePicker(
                    validator: requiredValidator.call,
                    controller: phone,
                    countryDetails: (String? code, String? country) {},
                  ),
                  FormBuilderTextField(
                    name: AppStrings.fullName,
                    decoration:
                        const InputDecoration(labelText: AppStrings.fullName),
                    keyboardType: TextInputType.text,
                    validator: requiredValidator.call,
                  ),
                  FormBuilderTextField(
                    name: AppStrings.email,
                    decoration:
                        const InputDecoration(labelText: AppStrings.email),
                    keyboardType: TextInputType.text,
                    validator: emailValidator.call,
                  ),
                  FormBuilderTextField(
                    validator: requiredValidator.call,
                    obscureText: true,
                    name: AppStrings.password,
                    decoration:
                        const InputDecoration(labelText: AppStrings.password),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    obscureText: true,
                    name: AppStrings.repeatPassword,
                    decoration: const InputDecoration(
                        labelText: AppStrings.repeatPassword),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.required;
                      }
                      if (true) {
                        return AppStrings.passwordsDoNotMatch;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              PrimaryElevatedButton(
                  text: AppStrings.createAccount, onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
