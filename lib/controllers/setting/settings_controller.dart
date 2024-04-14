import 'package:realfitzclient/controllers/base_controller.dart';
import 'package:realfitzclient/data/settings/settings_client.dart';
import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';

import '../../constants/strings.dart';

class SettingsController extends BaseController {
  final SettingsClient _settingsClient = SettingsClient();
  String? whatsAppSupportNumber;

  Future<String?> getWhatsAppSupportNumber() async {
    try {
      showLoadingIndicator();
      final supportNumber = await _settingsClient.getWhatsAppSupportNumber();
      if (supportNumber != null) {
        whatsAppSupportNumber = supportNumber;
        return supportNumber;
      } else {
        showFailureSnackBar(message: AppStrings.errorInFetchingSupportNumber);
        return null;
      }
    } catch (exception) {
      handleException(exception);
      return null;
    } finally {
      hideLoadingIndicator();
    }
  }
}
