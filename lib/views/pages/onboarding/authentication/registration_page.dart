import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
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

import '../../../resources/colors_manager.dart';
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

        isCenter: true,
        isLeading: true,
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
                        // const SizedBox(height: AppSizes.s10),
                        // Text(
                        //   AppStrings.heyThereAthlete,
                        //   style:
                        //       boldTextStyle.copyWith(fontSize: FontSizes.f18),
                        // ),
                        const SizedBox(height: AppSizes.s30),
                        PhoneCodePicker(
                          validator: phoneValidator.call,
                          controller: authController.phoneController,
                          countryDetails: (String? code, String? country) {
                            authController.countryCode = code;
                            authController.country = country;
                            // authController.phoneController.text=country.toString();
                            authController.update();
                          },
                        ),
                        const SizedBox(height: AppSizes.s12),
                        Text(
                          AppStrings.youWillUseThisNumberForAccountRecoveryOrOTPSignIn,
                          style: regularTextStyle.copyWith(color: AppColors.grey),
                        ),
                        const SizedBox(height: AppSizes.s26),
                        FormBuilderTextField(
                          name: AppStrings.fullName,
                          decoration: InputDecoration(
                              errorBorder:  OutlineInputBorder(
                                borderSide:  BorderSide(
                                  color: AppColors.red,
                                ),
                                borderRadius:  BorderRadius.circular(AppSizes.s12),
                              ),
                              enabledBorder:OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 1,
                                ),
                                borderRadius:  BorderRadius.circular(AppSizes.s12),
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 1,
                                ),
                                borderRadius:  BorderRadius.circular(AppSizes.s12),
                              ),
                              border:OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 1,
                                ),
                                borderRadius:  BorderRadius.circular(AppSizes.s12),
                              ),
                              hintStyle: hintTextStyle,
                              labelText: AppStrings.fullName),
                          keyboardType: TextInputType.text,
                          validator: requiredValidator.call,
                          controller: authController.nameController,
                        ),
                        const SizedBox(height: AppSizes.s22),
                        FormBuilderTextField(
                          name: AppStrings.email,
                          decoration: InputDecoration(
                            errorBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(
                                color: AppColors.red,
                              ),
                              borderRadius:  BorderRadius.circular(AppSizes.s12),
                            ),
                            enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                                width: 1,
                              ),
                              borderRadius:  BorderRadius.circular(AppSizes.s12),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                                width: 1,
                              ),
                              borderRadius:  BorderRadius.circular(AppSizes.s12),
                            ),
                            border:OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 1,
                                ),
                                borderRadius:  BorderRadius.circular(AppSizes.s12),),
                              hintStyle: hintTextStyle,

                              labelText: AppStrings.email),
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator.call,
                          controller: authController.emailController,
                        ),
                        const SizedBox(height: AppSizes.s22),
                        FormBuilderTextField(
                          validator: requiredValidator.call,
                          obscureText: true,
                          name: AppStrings.password,
                          decoration: InputDecoration(
                             errorBorder:  OutlineInputBorder(
                            borderSide:  BorderSide(
                              color: AppColors.red,
                            ),
                            borderRadius:  BorderRadius.circular(AppSizes.s12),
                          ),
                            enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                                width: 1,
                              ),
                              borderRadius:  BorderRadius.circular(AppSizes.s12),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                                width: 1,
                              ),
                              borderRadius:  BorderRadius.circular(AppSizes.s12),
                            ),
                            border:OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 1,
                                ),
                                borderRadius:  BorderRadius.circular(AppSizes.s12),),
                              hintStyle: hintTextStyle,
                              labelText: AppStrings.password),
                          keyboardType: TextInputType.text,
                          controller: authController.passwordController,
                        ),
                        const SizedBox(height: AppSizes.s22),
                        FormBuilderTextField(
                          obscureText: true,
                          name: AppStrings.repeatPassword,
                          decoration: InputDecoration(
                              hintStyle: hintTextStyle,
                            errorBorder:  OutlineInputBorder(
                              borderSide:  BorderSide(
                                color: AppColors.red,
                              ),
                              borderRadius:  BorderRadius.circular(AppSizes.s12),
                            ),
                            enabledBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                                width: 1,
                              ),
                              borderRadius:  BorderRadius.circular(AppSizes.s12),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.grey,
                                width: 1,
                              ),
                              borderRadius:  BorderRadius.circular(AppSizes.s12),
                            ),
                            border:OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 1,
                                ),
                                borderRadius:  BorderRadius.circular(AppSizes.s12),),
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
                    const SizedBox(height: AppSizes.s50),

                    Container(
                      width: Get.width,
                      height: 50,
                      child: PrimaryElevatedButton(
                        text: AppStrings.createAccount,
                        onPressed: authController.createAccount,
                      ),
                    )
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
