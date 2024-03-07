import 'package:realfitzclient/models/step/StepTarget.dart';
import 'package:realfitzclient/models/step/doughnut_chart_data.dart';

class HomePageData {
  String? name;
  String? accountBalance;
  List<DoughnutChartData> doughnutChartData = [];
  String? coinsToday;
  String? stepsToday;
  StepTarget? stepTarget;
  String? caloriesBurned;
  String? kmWalked;
}
