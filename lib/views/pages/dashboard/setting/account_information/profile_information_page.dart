import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:realfitzclient/controllers/onboarding/authentication_controller.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../../constants/strings.dart';
import '../../../../../utils/validators.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/values_manager.dart';
import '../../../../widgets/buttons.dart';

class ProfileInformationPage extends StatefulWidget {
  const ProfileInformationPage({super.key});

  @override
  State<ProfileInformationPage> createState() => _ProfileInformationPageState();
}

class _ProfileInformationPageState extends State<ProfileInformationPage> {
  late AuthenticationController authController;
  @override
  void initState() {
    authController = Get.put(AuthenticationController());
    authController.setUserInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.profile),
      body: ModalProgressHUD(
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
                      Text(
                        AppStrings.updateDetails,
                        style: boldTextStyle.copyWith(fontSize: FontSizes.f18),
                      ),
                      const SizedBox(height: AppSizes.s12),
                      FormBuilderTextField(
                        name: AppStrings.fullName,
                        decoration: InputDecoration(
                          hintStyle: regularTextStyle,
                          labelText: AppStrings.fullName,
                        ),
                        validator: requiredValidator.call,
                        controller: authController.nameController,
                        // controller: ,
                      ),
                      FormBuilderTextField(
                        enabled: false,
                        name: AppStrings.email,
                        decoration: InputDecoration(
                          hintStyle: regularTextStyle,
                          labelText: AppStrings.email,
                        ),
                        controller: authController.emailController,
                      ),
                      FormBuilderTextField(
                        enabled: false,
                        name: AppStrings.phone,
                        decoration: InputDecoration(
                          hintStyle: regularTextStyle,
                          labelText: AppStrings.phone,
                        ),
                        controller: authController.phoneController,
                      ),
                      FormBuilderTextField(
                        enabled: false,
                        name: AppStrings.country,
                        decoration: InputDecoration(
                          hintStyle: regularTextStyle,
                          labelText: AppStrings.country,
                        ),
                        controller: authController.countryController,
                      ),
                      FormBuilderTextField(
                        validator: requiredValidator.call,
                        obscureText: true,
                        name: AppStrings.password,
                        decoration: InputDecoration(
                          hintStyle: regularTextStyle,
                          labelText: AppStrings.password,
                        ),
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
                          if (value != authController.passwordController.text) {
                            return AppStrings.passwordsDoNotMatch;
                          }
                          return null;
                        },
                      ),
                      FormBuilderTextField(
                        enabled: false,
                        name: AppStrings.creationDate,
                        decoration: InputDecoration(
                          hintStyle: regularTextStyle,
                          labelText: AppStrings.creationDate,
                        ),
                        controller: authController.creationDateController,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.s20),
                  PrimaryElevatedButton(
                    text: AppStrings.updateDetails,
                    onPressed: authController.updateUserDetail,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
