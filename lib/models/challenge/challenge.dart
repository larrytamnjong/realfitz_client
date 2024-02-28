import '../reward/reward.dart';
import '../sponsor/sponsor.dart';

class Challenge {
  int? challengeId;
  String? title;
  String? detail;
  DateTime? startDate;
  DateTime? endDate;
  int? steps;
  String? image;
  bool? isParticipating;
  String? status;
  int? daysToStart;
  int? daysToEnd;
  String? totalStepsTaken;
  String? percentageCompleted;
  Sponsor? sponsor;
  Reward? reward;

  Challenge({
    this.challengeId,
    this.title,
    this.detail,
    this.startDate,
    this.endDate,
    this.steps,
    this.image,
    this.isParticipating,
    this.status,
    this.daysToStart,
    this.daysToEnd,
    this.totalStepsTaken,
    this.percentageCompleted,
    this.sponsor,
    this.reward,
  });
  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      challengeId: json['challenge_id'],
      title: json['title'] ?? '',
      detail: json['detail'] ?? '',
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      steps: json['steps'],
      image: json['image'],
      isParticipating: json['is_participating'],
      status: json['status'] ?? '',
      daysToStart: json['days_to_start'],
      daysToEnd: json['days_to_end'],
      totalStepsTaken: json['total_steps_taken'],
      percentageCompleted: json['percentage_completed'],
      sponsor: Sponsor.fromJson(json['sponsor']),
      reward: Reward.fromJson(json['reward']),
    );
  }
}
