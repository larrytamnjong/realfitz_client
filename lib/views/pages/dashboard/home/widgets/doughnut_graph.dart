import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:realfitzclient/views/styles/text_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../constants/strings.dart';
import '../../../../../models/step/chart_data.dart';
import '../../../../resources/colors_manager.dart';

class DoughnutGraph extends StatelessWidget {
  final List<DoughnutData> data;
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
              backgroundColor: AppColors.paleLime,
              palette: [
                AppColors.primary,
                AppColors.green,
                AppColors.pink,
                AppColors.indigo,
                AppColors.purple,
              ],
              series: <CircularSeries<DoughnutData, String>>[
                DoughnutSeries<DoughnutData, String>(
                  dataSource: data,
                  xValueMapper: (DoughnutData data, _) => data.x,
                  yValueMapper: (DoughnutData data, _) => data.y,
                  dataLabelMapper: (DoughnutData data, _) => data.x,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
