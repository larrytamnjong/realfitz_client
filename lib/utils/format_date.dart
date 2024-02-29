String formatDate(String inputDateString) {
  DateTime dateTime = DateTime.parse(inputDateString);

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String dayOfWeek = daysOfWeek[dateTime.weekday - 1];
  String month = months[dateTime.month - 1];
  String day = dateTime.day.toString();
  String year = dateTime.year.toString();

  String formattedDateString = '$dayOfWeek $month $day, $year';

  return formattedDateString;
}
