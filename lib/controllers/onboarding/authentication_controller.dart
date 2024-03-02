import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/user/user_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/dashboard_page.dart';
import 'package:realfitzclient/views/pages/onboarding/authentication/login_page.dart';
import 'package:realfitzclient/views/pages/onboarding/general/getting_started_page.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

import '../../constants/strings.dart';
import '../../data/onboarding/authentication_client.dart';
import '../../models/onboarding/user.dart';
import '../../utils/remove_country_code.dart';
import '../../views/resources/transitions.dart';

class AuthenticationController extends BaseController {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  String? countryCodeController;
  String? countryController;

  late AuthenticationClient authClient;
  final _otpless = Otpless();
  final UserController _userController = UserController();

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  void createAccount() async {
    if (formKey.currentState!.validate()) {
      User user = User(
          name: nameController.text,
          phone: phoneController.text,
          email: emailController.text,
          password: passwordController.text,
          countryCode: countryCodeController,
          country: countryController);

      _handleCreateAccount(user);
    }
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      User user =
          User(email: emailController.text, password: passwordController.text);
      _handleLogin(user);
    }
  }

  Future logout() async {
    try {
      await _userController.removeUser();
      Get.offAll(transition: downToUp, () => const GettingStartedPage());
    } catch (exception) {
      handleException(exception);
    }
  }

  void _handleLogin(User user) async {
    try {
      showLoadingIndicator();
      authClient = AuthenticationClient();
      authClient.user = user;
      User? loggedInUser = await authClient.login();
      if (loggedInUser != null) {
        await _userController.saveUserToLocalStorage(loggedInUser);
        showSuccessSnackBar();
        Get.offAll(transition: downToUp, () => const DashboardPage());
      } else {
        showFailureSnackBar(
            message: AppStrings.makeSureEmailAndPasswordAreCorrect);
      }
    } catch (exception) {
      handleException(exception);
    } finally {
      hideLoadingIndicator();
    }
  }

  void _handleCreateAccount(User user) async {
    try {
      showLoadingIndicator();
      authClient = AuthenticationClient();
      authClient.user = user;
      bool accountIsCreated = await authClient.createAccount();
      if (accountIsCreated) {
        showSuccessSnackBar();
        Get.off(transition: downToUp, () => const LoginPage());
      } else {
        showFailureSnackBar(message: AppStrings.checkIfUserDoesNotAlreadyExist);
      }
    } catch (exception) {
      handleException(exception);
    } finally {
      hideLoadingIndicator();
    }
  }

  Future<void> signInWithWhatsApp() async {
    try {
      showLoadingIndicator();
      if (await _isWhatsAppInstalled()) {
        authClient = AuthenticationClient();
        await _otpless.hideFabButton();
        _otpless.openLoginPage(
          (result) async {
            String? phone = await result['data']['mobile']['number'];
            if (await result['data'] != null) {
              User? user = await authClient.whatsAppLogin(
                  phone: removeCountryCode(phone!));
              if (user != null) {
                await _userController.saveUserToLocalStorage(user);
                Get.offAll(transition: downToUp, () => const DashboardPage());
              } else {
                showFailureSnackBar(message: AppStrings.failedToRetrieveUser);
              }
            }
          },
        );
      } else {
        showFailureSnackBar(message: AppStrings.pleaseInstallWhatsApp);
      }
    } catch (exception) {
      handleException(exception);
    } finally {
      hideLoadingIndicator();
    }
  }

  Future<bool> _isWhatsAppInstalled() async {
    bool whatsAppInstalled = await _otpless.isWhatsAppInstalled();
    if (whatsAppInstalled) {
      return true;
    } else {
      return false;
    }
  }
}
