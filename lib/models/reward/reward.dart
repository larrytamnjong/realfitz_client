class Reward {
  int? id;
  String? caption;
  String? detail;
  String? image;
  int? sponsorId;
  int? categoryId;
  String? howToRedeem;
  String? termsAndConditions;
  DateTime? expiryDate;
  bool? isUserRedeemable;

  Reward({
    this.id,
    this.caption,
    this.detail,
    this.image,
    this.sponsorId,
    this.categoryId,
    this.howToRedeem,
    this.termsAndConditions,
    this.expiryDate,
    this.isUserRedeemable,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
        id: json['id'],
        caption: json['caption'],
        detail: json['detail'],
        image: json['image'],
        sponsorId: json['sponsor_id'],
        categoryId: json['category_id'],
        howToRedeem: json['how_to_redeem'],
        termsAndConditions: json['terms_and_conditions'],
        expiryDate: json['expiry_date'],
        isUserRedeemable: json['is_user_redeemable']);
  }
}
