class ChallengeParticipants {
  String? participantName;
  String? totalSteps;

  ChallengeParticipants(
      {required this.participantName, required this.totalSteps});

  factory ChallengeParticipants.fromJson(Map<String, dynamic> json) {
    return ChallengeParticipants(
      participantName: json['participant_name']?.toString(),
      totalSteps: json['total_steps'] ?? "0",
    );
  }
}
