class UserReward {
  int id;
  int userId;
  int rewardId;
  String creationDate;

  UserReward({
    required this.id,
    required this.userId,
    required this.rewardId,
    required this.creationDate,
  });

  factory UserReward.fromJson(Map<String, dynamic> json) {
    return UserReward(
      id: json['id'],
      userId: json['user_id'],
      rewardId: json['reward_id'],
      creationDate: json['creation_date'],
    );
  }
}
