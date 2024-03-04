class StepTarget {
  String? id;
  String? target;

  StepTarget({this.id, this.target});

  factory StepTarget.fromJson(Map<String, dynamic> json) {
    return StepTarget(
      id: json['id']?.toString(),
      target: json['target']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'target': target,
    };
  }
}
