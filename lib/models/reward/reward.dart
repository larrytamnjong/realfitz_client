import 'package:realfitzclient/models/reward/user_reward.dart';

import '../category/category.dart';
import '../sponsor/sponsor.dart';

class Reward {
  String id;
  String detail;
  String voucherCode;
  String? image;
  String creationDate;
  String howToRedeem;
  String? coinsNeededToRedeem;
  bool isUserRedeemable;
  String termsAndConditions;
  String caption;
  String expiryDate;
  Sponsor? sponsor;
  Category? category;
  UserReward? userReward;

  Reward({
    required this.id,
    required this.detail,
    required this.voucherCode,
    this.image,
    required this.creationDate,
    required this.howToRedeem,
    this.coinsNeededToRedeem,
    required this.isUserRedeemable,
    required this.termsAndConditions,
    required this.caption,
    required this.expiryDate,
    this.sponsor,
    this.category,
    this.userReward,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      id: json['id'].toString(),
      detail: json['detail'] ?? '',
      voucherCode: json['voucher_code'] ?? '',
      image: json['image'],
      creationDate: json['creation_date'],
      howToRedeem: json['how_to_redeem'] ?? '',
      coinsNeededToRedeem: json['coins_needed_to_redeem'].toString(),
      isUserRedeemable: json['is_user_redeemable'].toString() == "1",
      termsAndConditions: json['terms_and_conditions'] ?? '',
      caption: json['caption'],
      expiryDate: json['expiry_date'],
      sponsor:
          json['sponsor'] != null ? Sponsor.fromJson(json['sponsor']) : null,
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      userReward: json['user_reward'] != null
          ? UserReward.fromJson(json['user_reward'])
          : null,
    );
  }
}
