double roundToTwoDecimalPlaces(double number) {
  double multipliedNumber = number * 100;
  double roundedNumber = double.parse(multipliedNumber.toStringAsFixed(2));
  return roundedNumber;
}
