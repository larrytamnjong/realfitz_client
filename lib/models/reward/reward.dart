class Reward {
  int id;
  String caption;
  String detail;
  String? image;
  int? sponsorId;
  int? categoryId;
  String howToRedeem;
  String termsAndConditions;
  String expiryDate;
  bool? isUserRedeemable;

  Reward({
    required this.id,
    required this.caption,
    required this.detail,
    this.image,
    this.sponsorId,
    this.categoryId,
    required this.howToRedeem,
    required this.termsAndConditions,
    required this.expiryDate,
    this.isUserRedeemable,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      id: json['id'],
      caption: json['caption'],
      detail: json['detail'] ?? '',
      image: json['image'],
      sponsorId: json['sponsor_id'],
      categoryId: json['category_id'],
      howToRedeem: json['how_to_redeem'] ?? '',
      termsAndConditions: json['terms_and_conditions'] ?? '',
      expiryDate: json['expiry_date'],
      isUserRedeemable: json['is_user_redeemable'] == 1,
    );
  }
}
