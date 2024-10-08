import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:realfitzclient/views/widgets/appbar.dart';

import '../../../../constants/strings.dart';
import '../../../../controllers/onboarding/authentication_controller.dart';
import '../../../../utils/validators.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/styles/text_styles.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthenticationController authController;
  @override
  void initState() {
    authController = Get.put(AuthenticationController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppStrings.login, isCenter: true,isLeading: true,),
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: authController.isShowingLoadingIndicator.value,
          progressIndicator: const CircularProgressIndicator(),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: authController.formKey,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   AppStrings.heyThereAthlete,
                        //   style:
                        //       boldTextStyle.copyWith(fontSize: FontSizes.f18),
                        // ),
                        const SizedBox(height: AppSizes.s100),
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
                                borderRadius:  BorderRadius.circular(AppSizes.s12),
                              ),
                              hintStyle: hintTextStyle,

                              labelText: AppStrings.email),
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator.call,
                          controller: authController.emailController,
                        ),
                        const SizedBox(height: AppSizes.s20),
                        FormBuilderTextField(
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
                                borderRadius:  BorderRadius.circular(AppSizes.s12),
                              ),
                              hintStyle: hintTextStyle,
                              labelText: AppStrings.password),
                          keyboardType: TextInputType.text,
                          validator: requiredValidator.call,
                          controller: authController.passwordController,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.s100),
                    Container(
                      width: Get.width,
                      height: 50,
                      child: PrimaryElevatedButton(
                          text: AppStrings.login,
                          onPressed: authController.login),
                    ),
                    PrimaryTextButton(
                      text: AppStrings.signInWithWhatsAppOTP,
                      color: AppColors.black,
                      fontSize: FontSizes.f15,
                      onPressed: () async {
                        await authController.signInWithWhatsApp();
                      },
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
