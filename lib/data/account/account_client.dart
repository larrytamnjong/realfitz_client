import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/api_urls.dart';
import '../../models/account/account_balance.dart';

class AccountClient {
  Future<AccountBalance?> getAccountBalance({required String id}) async {
    try {
      final response = await http.get(Uri.parse('$getAccountBalanceUrl$id'));
      if (response.statusCode == 200) {
        return AccountBalance.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
