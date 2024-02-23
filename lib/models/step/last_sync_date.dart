class StepLastSyncDate {
  DateTime? lastSyncDate;

  StepLastSyncDate({this.lastSyncDate});

  factory StepLastSyncDate.fromJson(Map<String, dynamic> json) {
    return StepLastSyncDate(
        lastSyncDate: json['last_sync_date'] != null
            ? DateTime.parse(json['last_sync_date'])
            : null);
  }
}
