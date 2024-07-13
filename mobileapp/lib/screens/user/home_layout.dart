import 'package:flutter/material.dart';
import 'package:mobileapp/screens/root/login_screen.dart';
import 'package:mobileapp/screens/user/sub_screens/category_screen.dart';
import 'package:mobileapp/screens/user/sub_screens/dash_bord.dart';
import 'package:mobileapp/screens/user/sub_screens/home_screen.dart';
import 'package:mobileapp/screens/user/sub_screens/lot_screen.dart';
import 'package:mobileapp/screens/user/sub_screens/user_screen.dart';
import 'package:mobileapp/provider/theme_provider.dart';
import 'package:mobileapp/utils/util.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final pages = const [
    DashBordScreen(),
    CategoryWidget(),
    UsersListScreen(),
    LotoScreen(),
    HomeScreenWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 23,
        unselectedItemColor:
            Provider.of<ThemeProvider>(context).themeData.colorScheme.primary,
        selectedItemColor:
            Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
        backgroundColor: Provider.of<ThemeProvider>(context)
            .themeData
            .colorScheme
            .background,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Dash bord',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.inbox),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: "Users",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.nfc),
            label: "Lots",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: "Home",
          ),
        ],
        currentIndex: _currentPage,
        onTap: (value) {
          setState(() {
            _currentPage = value;
          });
        },
      ),
      body: pages[_currentPage],
    );
  }

  // check
  _check() async {
    bool isLogged = await checkLoginBefore('token');
    if (!isLogged) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => LoginScreen(),
          ),
          (route) => false);
    }
  }
}
