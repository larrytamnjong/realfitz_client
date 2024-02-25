import 'package:realfitzclient/controllers/base_controller.dart';

import '../../models/onboarding/user.dart';
import '../../services/local_storage/local_storage_service.dart';

class UserController extends BaseController {
  Future saveUserToLocalStorage(User user) async {
    await LocalStorageService.saveUser(user);
  }

  Future<int?> getUserId() async {
    return await LocalStorageService.getUserId();
  }

  Future<String?> getUserName() async {
    return await LocalStorageService.getUserName();
  }
}
