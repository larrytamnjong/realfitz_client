String getCoinsValueFromSteps(String? steps) {
  if (steps != null) {
    double coins = double.parse(steps) / 1000;
    return coins.round().toString();
  } else {
    return 0.toString();
  }
}
