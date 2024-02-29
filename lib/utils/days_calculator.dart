String getNumberOfDays(String startDateString, String endDateString) {
  DateTime startDate = DateTime.parse(startDateString);
  DateTime endDate = DateTime.parse(endDateString);

  return endDate.difference(startDate).inDays.toString();
}
