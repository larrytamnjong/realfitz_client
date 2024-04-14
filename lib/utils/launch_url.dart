import 'package:realfitzclient/views/resources/dialogs/snack_bars.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/strings.dart';

launchExternalUrl({required String urlString}) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    showFailureSnackBar(message: AppStrings.error);
  }
}
