import '../reward/reward.dart';
import '../sponsor/sponsor.dart';

class Challenge {
  int challengeId;
  String title;
  String detail;
  String startDate;
  String endDate;
  int steps;
  String image;
  bool isParticipating;
  String status;
  int? daysToStart;
  int? daysToEnd;
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
      challengeId: json['id'],
      title: json['title'],
      detail: json['detail'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      steps: json['steps'],
      image: json['image'],
      isParticipating: json['is_participating'] == 1,
      status: json['status'],
      daysToStart: json['days_to_start'],
      daysToEnd: json['days_to_end'],
      totalStepsTaken: json['total_steps_taken'] ?? '0',
      percentageCompleted: json['percentage_completed'],
      sponsor: Sponsor.fromJson(json['sponsor']),
      reward: Reward.fromJson(json['reward']),
    );
  }
}
