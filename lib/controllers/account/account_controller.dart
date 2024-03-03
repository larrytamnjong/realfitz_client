import 'package:realfitzclient/controllers/base_controller.dart';

import '../../data/account/account_client.dart';
import '../../models/account/account_balance.dart';
import '../user/user_controller.dart';

class AccountController extends BaseController {
  final AccountClient _accountClient = AccountClient();
  final UserController _userController = UserController();
  Future<String?> getAccountBalance() async {
    try {
      String? id = await _userController.getUserId();
      AccountBalance? accountBalance =
          await _accountClient.getAccountBalance(id: id!);
      return accountBalance?.accountBalance;
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
