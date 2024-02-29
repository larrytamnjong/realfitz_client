class Participation {
  int? id;
  int? challengeId;

  Participation({this.id, this.challengeId});

  Map<String, dynamic> toJson() {
    return {'id': id, 'challenge_id': challengeId};
  }
}
