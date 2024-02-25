import 'package:realfitzclient/constants/strings.dart';

String formatAmount(String accountBalance) {
  if (double.tryParse(accountBalance) == null) {
    throw ArgumentError(AppStrings.invalidAccountBalance);
  }

  double balance = double.parse(accountBalance);

  String formattedBalance = balance.toStringAsFixed(2);

  return formattedBalance;
}
