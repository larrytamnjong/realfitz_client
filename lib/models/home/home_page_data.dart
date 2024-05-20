import 'package:realfitzclient/models/onboarding/ad_Images.dart';
import 'package:realfitzclient/models/step/doughnut_chart_data.dart';
import 'package:realfitzclient/models/step/step_target.dart';

import '../reward/reward.dart';

class HomePageData {
  String? name;
  String? accountBalance;
  List<DoughnutChartData> doughnutChartData = [];
  String? coinsToday;
  String? stepsToday;
  StepTarget? stepTarget;
  String? caloriesBurned;
  String? kmWalked;
  List<Reward>? rewards;
  List<AdImage>? adImages;
}
