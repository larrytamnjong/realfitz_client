class Step {
  String? id;
  String? steps;
  DateTime? syncDate;

  Step({this.id, this.steps, this.syncDate});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'steps': steps,
      'sync_date': syncDate.toString(),
    };
  }
}
