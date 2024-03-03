class UserReward {
  String id;
  String userId;
  String rewardId;
  String creationDate;

  UserReward({
    required this.id,
    required this.userId,
    required this.rewardId,
    required this.creationDate,
  });

  factory UserReward.fromJson(Map<String, dynamic> json) {
    return UserReward(
      id: json['id'].toString(),
      userId: json['user_id'].toString(),
      rewardId: json['reward_id'].toString(),
      creationDate: json['creation_date'],
    );
  }
}
