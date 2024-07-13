import 'package:flutter/material.dart';
import 'package:mobileapp/screens/root/splash_screen.dart';
import 'package:mobileapp/provider/data_provider.dart';
import 'package:mobileapp/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      // home: TableTwoWidget(),
      home: Splash_screen(),
    );
  }
}
