double getPercentage(String? percentString) {
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
