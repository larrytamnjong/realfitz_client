class UserReward {
  int id;
  int userId;
  int rewardId;
  String rewardVoucherCode;
  String creationDate;

  UserReward({
    required this.id,
    required this.userId,
    required this.rewardVoucherCode,
    required this.rewardId,
    required this.creationDate,
  });

  factory UserReward.fromJson(Map<String, dynamic> json) {
    return UserReward(
      id: json['id'],
      userId: json['user_id'],
      rewardId: json['reward_id'],
      rewardVoucherCode: json['reward_voucher_code'] ?? '',
      creationDate: json['creation_date'],
    );
  }
}
