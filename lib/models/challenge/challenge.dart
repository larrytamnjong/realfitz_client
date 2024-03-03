import '../reward/reward.dart';
import '../sponsor/sponsor.dart';

class Challenge {
  String challengeId;
  String title;
  String detail;
  String startDate;
  String endDate;
  String steps;
  String image;
  bool isParticipating;
  String status;
  String? daysToStart;
  String? daysToEnd;
  String? totalStepsTaken;
  String? percentageCompleted;
  Sponsor sponsor;
  Reward reward;

  Challenge({
    required this.challengeId,
    required this.title,
    required this.detail,
    required this.startDate,
    required this.endDate,
    required this.steps,
    required this.image,
    required this.isParticipating,
    required this.status,
    this.daysToStart,
    this.daysToEnd,
    this.totalStepsTaken,
    this.percentageCompleted,
    required this.sponsor,
    required this.reward,
  });
  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      challengeId: json['id'].toString(),
      title: json['title'],
      detail: json['detail'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      steps: json['steps'].toString(),
      image: json['image'],
      isParticipating: json['is_participating'].toString() == "1",
      status: json['status'],
      daysToStart: json['days_to_start']?.toString(),
      daysToEnd: json['days_to_end']?.toString(),
      totalStepsTaken: json['total_steps_taken'] ?? '0',
      percentageCompleted: json['percentage_completed'],
      sponsor: Sponsor.fromJson(json['sponsor']),
      reward: Reward.fromJson(json['reward']),
    );
  }
}
