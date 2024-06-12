import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:realfitzclient/constants/otpless_app_id.dart';
import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/controllers/user/user_controller.dart';
import 'package:realfitzclient/views/pages/dashboard/dashboard_page.dart';
import 'package:realfitzclient/views/pages/onboarding/authentication/login_page.dart';
import 'package:realfitzclient/views/pages/onboarding/general/getting_started_page.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

import '../../constants/strings.dart';
import '../../data/onboarding/authentication_client.dart';
import '../../models/onboarding/user.dart';
import '../../views/resources/transitions.dart';

class AuthenticationController extends BaseController {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final creationDateController = TextEditingController();
  final countryController = TextEditingController();
  String? countryCode;
  String? country;

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
          phone: phoneController.text.replaceAll(RegExp(r'\s+'), ''),
          email: emailController.text,
          password: passwordController.text,
          countryCode: countryCode,
          country: country);

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

  void updateUserDetail() async {
    if (formKey.currentState!.validate()) {
      String? id = await _userController.getUserId();
      User user = User(
        id: id,
        name: nameController.text,
        password: passwordController.text,
      );
      _handleUpdateUserDetail(user);
    }
  }

  void deleteUser() async {
    try {
      showLoadingIndicator();
      authClient = AuthenticationClient();
      String? id = await _userController.getUserId();
      User user = User(id: id);
      authClient.user = user;
      bool isUserDeleted = await authClient.deleteAccount();
      if (isUserDeleted) {
        await _userController.removeUser();
        showSuccessSnackBar();
        Get.offAll(() => GettingStartedPage());
      } else {
        showFailureSnackBar(message: AppStrings.failedToDeleteUser);
      }
    } catch (exception) {
      handleException(exception);
    } finally {
      hideLoadingIndicator();
    }
  }

  Future setUserInformation() async {
    User user = await _userController.getUserDetails();
    nameController.text = user.name ?? '';
    emailController.text = user.email ?? '';
    phoneController.text = '${user.countryCode}-${user.phone}';
    creationDateController.text = user.creationDate ?? '';
    countryController.text = user.country ?? '';
    passwordController.text = '';
    repeatPasswordController.text = '';
  }

  Future logout() async {
    try {
      await _userController.removeUser();
      Get.offAll(transition: downToUp, () => GettingStartedPage());
    } catch (exception) {
      handleException(exception);
    }
  }

  void _handleUpdateUserDetail(User user) async {
    try {
      showLoadingIndicator();
      authClient = AuthenticationClient();
      authClient.user = user;
      bool userIsUpdated = await authClient.updateUserDetail();
      if (userIsUpdated) {
        showSuccessSnackBar();
        Get.offAll(() => GettingStartedPage());
      } else {
        showFailureSnackBar(message: AppStrings.failedToUpdateUserDetail);
      }
    } catch (exception) {
      handleException(exception);
    } finally {
      hideLoadingIndicator();
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
        _otpless.openLoginPage((result) async {
          var phone = await result['data']['identities'][0]['identityValue'];
          if (await result['data'] != null &&
              result['data']['identities'][0]['verified'] == true) {
            showLoadingIndicator();
            User? user = await authClient.whatsAppLogin(phone: phone);
            if (user != null) {
              await _userController.saveUserToLocalStorage(user);
              Get.offAll(transition: downToUp, () => const DashboardPage());
            } else {
              showFailureSnackBar(message: AppStrings.failedToRetrieveUser);
              hideLoadingIndicator();
            }
          }
        }, {'appId': otpLessAppId});
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
