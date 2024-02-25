class AccountBalance {
  String? accountBalance;
  AccountBalance({this.accountBalance});

  factory AccountBalance.fromJson(Map<String, dynamic> json) {
    return AccountBalance(accountBalance: json['account_balance']);
  }
}
