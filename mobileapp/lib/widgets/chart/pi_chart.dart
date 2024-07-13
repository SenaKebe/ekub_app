import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

import 'dart:math';

class CustomePichartWidget extends StatefulWidget {
  const CustomePichartWidget({super.key});

  @override
  State<CustomePichartWidget> createState() => _CustomePichartWidgetState();
}

class _CustomePichartWidgetState extends State<CustomePichartWidget> {
  List<NumericData> numericDataList = [
    NumericData(domain: 1, measure: 3, color: Colors.grey[300]),
    NumericData(domain: 2, measure: 5, color: Colors.green[300]),
    NumericData(domain: 3, measure: 9, color: Colors.orange[300]),
    NumericData(domain: 4, measure: 6.5, color: Colors.red[300]),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartPieN(
          data: numericDataList,
        ),
      ),
    );
  }
}

class CustomePieChartTwoWidget extends StatelessWidget {
  const CustomePieChartTwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<OrdinalData> ordinalDataList = [
      OrdinalData(domain: 'Mon', measure: 1, color: Colors.blue[300]),
      OrdinalData(domain: 'Tue', measure: 5, color: Colors.amber[300]),
      OrdinalData(domain: 'Wed', measure: 9, color: Colors.purple[300]),
      OrdinalData(domain: 'Thu', measure: 6.5, color: Colors.pink[300]),
    ];
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DChartPieO(
        data: ordinalDataList,
        customLabel: (ordinalData, index) {
          return "${ordinalData.domain}: ${ordinalData.measure}";
        },
        configRenderPie: ConfigRenderPie(
          arcLabelDecorator: ArcLabelDecorator(
            labelPosition: ArcLabelPosition.auto,
            insideLabelStyle: const LabelStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            outsideLabelStyle: const LabelStyle(
              color: Colors.red,
              fontSize: 16,
            ),
            labelPadding: 10,
            leaderLineStyle: const ArcLabelLeaderLineStyle(
              color: Colors.blue,
              length: 30,
              thickness: 2,
            ),
            showLeaderLines: true,
          ),
          arcLength: 2 * pi,
          // arcRatio: 0.25,
          arcWidth: 20,
          startAngle: -pi / 2,
          strokeWidthPx: 2,
        ),
      ),
    );
  }
}
