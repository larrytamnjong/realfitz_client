import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../constants/strings.dart';
import '../../../../../models/step/doughnut_chart_data.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/styles/text_styles.dart';
import 'package:intl/intl.dart';

class DoughnutGraph extends StatelessWidget {
  final List<DoughnutChartData> data;

  // final List<CartesianSeries> data;
  const DoughnutGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.cumulativeStepData,
                style: boldTextStyle.copyWith(fontSize: FontSizes.f20),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.s18),
          ClipRRect(
              borderRadius: BorderRadius.circular(AppBorderRadius.r5),
              child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 35000,

                      axisLine: AxisLine(width: 0),
                      labelFormat: '{value} st.',
                      majorTickLines: MajorTickLines(size: 0)),
                  tooltipBehavior:  TooltipBehavior(
                      enable: true,
                      tooltipPosition: TooltipPosition.pointer,
                      header: "Step",
                      canShowMarker: false
                  ),
                  plotAreaBorderWidth: 0,
                  trackballBehavior: TrackballBehavior(
                    lineColor: AppColors.primary,
                  ),
                  series: <CartesianSeries>[
                    LineSeries<DoughnutChartData, String>(
                        dataSource: data,
                        color: AppColors.primary,
                        markerSettings: MarkerSettings(
                            isVisible: true,
                            color: AppColors.primary,
                            borderColor: AppColors.primary),
                        xValueMapper: (DoughnutChartData data, _) => data.x,
                        yValueMapper: (DoughnutChartData data, _) => data.y)
                  ])

              /*SfCartesianChart(
                title: ChartTitle(text: 'Annual rainfall of Paris'),
                plotAreaBorderWidth: 0,
                primaryXAxis: DateTimeAxis(
                    intervalType: DateTimeIntervalType.years,
                    dateFormat: DateFormat.y(),
                    majorGridLines: const MajorGridLines(width: 0),
                    title: AxisTitle(text: 'Year')),
                primaryYAxis: const NumericAxis(
                    minimum: 200,
                    maximum: 600,
                    interval: 100,
                    axisLine: AxisLine(width: 0),
                    labelFormat: '{value}mm',
                    majorTickLines: MajorTickLines(size: 0)),
                series: _getMultiColoredLineSeries(),
                // trackballBehavior: _trackballBehavior,
              )*/

              /*SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  palette: [
                    AppColors.primary,
                    AppColors.green,
                    AppColors.blue,
                    AppColors.brightTeal,
                    AppColors.pink,
                  ],
                  tooltipBehavior: TooltipBehavior(
                      enable: true,
                      tooltipPosition: TooltipPosition.pointer,
                      header: "Score",
                      canShowMarker: false),
                  plotAreaBorderWidth: 0,
                  trackballBehavior: TrackballBehavior(
                    lineColor: AppColors.primary,
                  ),
                  // primaryXAxis: DateTimeAxis(),
                  series: <CartesianSeries>[
                    // Renders line chart
                    LineSeries<DoughnutChartData, String>(
                      dataSource: data,
                      color: AppColors.primary,
                      markerSettings: MarkerSettings(
                          isVisible: true,
                          color: AppColors.primary,
                          borderColor: AppColors.primary),
                      xValueMapper: (DoughnutChartData data, _) => data.x,
                      yValueMapper: (DoughnutChartData data, _) => data.y,
                    )
                  ])*/ /*SfCircularChart(
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
            ),*/
              ),
        ],
      ),
    );
  }

// List<LineSeries<DoughnutChartData, DateTime>> _getMultiColoredLineSeries() {
//   return <LineSeries<DoughnutChartData, DateTime>>[
//     LineSeries<DoughnutChartData, DateTime>(
//         dataSource: <DoughnutChartData>[
//           DoughnutChartData(DateTime(2024, 6, 1), 350,
//               lineColor:  Color.fromRGBO(248, 184, 131, 1)),
//           DoughnutChartData(DateTime(2024, 6, 2), 375,
//               lineColor:  Color.fromRGBO(248, 184, 131, 1)),
//           DoughnutChartData(DateTime(2024, 6, 3), 415,
//               lineColor:  Color.fromRGBO(248, 184, 131, 1)),
//           DoughnutChartData(DateTime(2024, 6, 4), 408,
//               lineColor:  Color.fromRGBO(248, 184, 131, 1)),
//           DoughnutChartData(DateTime(2024, 6, 5), 415,
//               lineColor:  Color.fromRGBO(248, 184, 131, 1)),
//           DoughnutChartData(DateTime(2024, 6, 6), 500,
//               lineColor:  Color.fromRGBO(248, 184, 131, 1)),
//           DoughnutChartData(DateTime(2024, 6, 7), 390,
//               lineColor:  Color.fromRGBO(229, 101, 144, 1)),
//         ],
//         xValueMapper: (DoughnutChartData sales, _) => sales.x,
//         yValueMapper: (DoughnutChartData sales, _) => sales.y,
//
//         /// The property used to apply the color each data.
//         pointColorMapper: (DoughnutChartData sales, _) => sales.lineColor)
//   ];
// }
}
