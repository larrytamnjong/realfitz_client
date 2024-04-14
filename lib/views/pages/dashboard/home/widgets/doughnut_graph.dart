import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../constants/strings.dart';
import '../../../../../models/step/doughnut_chart_data.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';

class DoughnutGraph extends StatelessWidget {
  final List<DoughnutChartData> data;
  const DoughnutGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.cumulativeStepData,
            style: boldTextStyle.copyWith(
                color: AppColors.primary, fontSize: FontSizes.f16),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppBorderRadius.r5),
            child: SfCircularChart(
              legend: const Legend(
                isVisible: true,
              ),
              backgroundColor: AppColors.paleLime,
              palette: [
                AppColors.primary,
                AppColors.green,
                AppColors.blue,
                AppColors.brightTeal,
                AppColors.pink,
              ],
              series: <CircularSeries<DoughnutChartData, String>>[
                DoughnutSeries<DoughnutChartData, String>(
                  dataSource: data,
                  xValueMapper: (DoughnutChartData data, _) => data.x,
                  yValueMapper: (DoughnutChartData data, _) => data.y,
                  dataLabelMapper: (DoughnutChartData data, _) => data.x,
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
