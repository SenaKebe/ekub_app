import 'package:flutter/material.dart';
import 'package:mobileapp/widgets/back_botton.dart';
import 'package:mobileapp/widgets/bottom_bar.dart';
import 'package:mobileapp/widgets/button_wiget.dart';
import 'package:mobileapp/widgets/chart/line_chart.dart';
import 'package:mobileapp/widgets/customSnackBar.dart';
import 'package:mobileapp/widgets/horizontal_category.dart';
import 'package:mobileapp/widgets/input_field.dart';
import 'package:mobileapp/widgets/loading_indicator.dart';
import 'package:mobileapp/widgets/search_bar.dart';
import 'package:mobileapp/widgets/table_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: LineChartWidge(),
          // child: Column(
          //   children: [
          //     const TableViewWidget(),

          //     const SizedBox(
          //       height: 10,
          //     ),
          //     CustomInputField(
          //       fieldType: InputFieldType.email,
          //       textEditingController: _emailController,
          //       hintText: 'Enter your email',
          //       labelText: 'Email',
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     CustomInputField(
          //       fieldType: InputFieldType.password,
          //       textEditingController: _passwordController,
          //       hintText: 'Enter your password',
          //       labelText: 'Password',
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     CustomInputField(
          //       fieldType: InputFieldType.name,
          //       textEditingController: _nameController,
          //       hintText: 'Enter your name',
          //       labelText: 'Name',
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     CustomButtonWidget(
          //       text: "submittt",
          //       onPressed: () {},
          //       gradientColors: const [Colors.blue, Colors.purple],
          //     ),
          //     const BottomNavBarWidget(),
          //     const DottedCircularProgressIndicatorWidget(
          //       currentDotColor: Colors.greenAccent,
          //       defaultDotColor: Colors.blueAccent,
          //       numDots: 6,
          //     ),
          //     SearchInputWidget(
          //         textController: _nameController, hintText: 'User'),
          //     const HorizontalCategoriesViewWidget(),
          //     const TopBarWidget()
          //   ],
          // ),
        ),
      ),
    );
  }
}
