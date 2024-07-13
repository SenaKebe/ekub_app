import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobileapp/widgets/chart/bar_chat.dart';
import 'package:mobileapp/widgets/chart/line_chart.dart';
import 'package:mobileapp/widgets/chart/pi_chart.dart';

class DashBordScreen extends StatefulWidget {
  const DashBordScreen({super.key});

  @override
  State<DashBordScreen> createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CustomeLineChartWidget(
                isShowingMainData: true,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CustomeBarChartWidget(),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CustomePichartWidget(),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: CustomePieChartTwoWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
