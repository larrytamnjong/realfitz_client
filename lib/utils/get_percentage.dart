double getPercentageOnTen(String? percentString) {
  if (percentString == null) {
    return 0.0;
  } else {
    double percent = double.parse(percentString);
    if (percent >= 100.00) {
      return 1;
    } else {
      return percent / 100;
    }
  }
}

String calculatePercentage(String numerator, String denominator) {
  double percentage =
      (double.parse(numerator) / double.parse(denominator)) * 100;
  return percentage.toString();
}
