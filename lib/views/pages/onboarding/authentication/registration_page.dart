import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:realfitzclient/constants/strings.dart';
import 'package:realfitzclient/controllers/onboarding/authentication_controller.dart';
import 'package:realfitzclient/utils/validators.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/widgets/buttons.dart';
import 'package:realfitzclient/views/widgets/phone_code_picker.dart';

import '../../../resources/styles/text_styles.dart';
import '../../../widgets/appbar.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late AuthenticationController authController;
  @override
  void initState() {
    authController = Get.put(AuthenticationController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: AppStrings.createAccount,
      ),
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: authController.isShowingLoadingIndicator.value,
          progressIndicator: const CircularProgressIndicator(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: FormBuilder(
                key: authController.formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSizes.s10),
                        Text(
                          AppStrings.heyThereAthlete,
                          style:
                              boldTextStyle.copyWith(fontSize: FontSizes.f18),
                        ),
                        const SizedBox(height: AppSizes.s12),
                        PhoneCodePicker(
                          validator: requiredValidator.call,
                          controller: authController.phoneController,
                          countryDetails: (String? code, String? country) {
                            authController.countryCodeController = code;
                            authController.countryController = country;
                          },
                        ),
                        FormBuilderTextField(
                          name: AppStrings.fullName,
                          decoration: InputDecoration(
                              hintStyle: regularTextStyle,
                              labelText: AppStrings.fullName),
                          keyboardType: TextInputType.text,
                          validator: requiredValidator.call,
                          controller: authController.nameController,
                        ),
                        FormBuilderTextField(
                          name: AppStrings.email,
                          decoration: InputDecoration(
                              hintStyle: regularTextStyle,
                              labelText: AppStrings.email),
                          keyboardType: TextInputType.text,
                          validator: emailValidator.call,
                          controller: authController.emailController,
                        ),
                        FormBuilderTextField(
                          validator: requiredValidator.call,
                          obscureText: true,
                          name: AppStrings.password,
                          decoration: InputDecoration(
                              hintStyle: regularTextStyle,
                              labelText: AppStrings.password),
                          keyboardType: TextInputType.text,
                          controller: authController.passwordController,
                        ),
                        FormBuilderTextField(
                          obscureText: true,
                          name: AppStrings.repeatPassword,
                          decoration: InputDecoration(
                              hintStyle: regularTextStyle,
                              labelText: AppStrings.repeatPassword),
                          keyboardType: TextInputType.text,
                          controller: authController.repeatPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.required;
                            }
                            if (value !=
                                authController.passwordController.text) {
                              return AppStrings.passwordsDoNotMatch;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.s20),
                    PrimaryElevatedButton(
                        text: AppStrings.createAccount,
                        onPressed: authController.createAccount)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
