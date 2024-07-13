import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/screens/root/login_screen.dart';
import 'package:mobileapp/screens/user/home_layout.dart';
import 'package:mobileapp/provider/data_provider.dart';
import 'package:mobileapp/utils/util.dart';
import 'package:mobileapp/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<DataProvider>(context, listen: false).fetchCategory();
      Provider.of<DataProvider>(context, listen: false).fetchLots();
      Provider.of<DataProvider>(context, listen: false).fetchUsers();
    });
    Future.delayed(const Duration(seconds: 0), () {
      _check();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                // child: SvgPicture.asset('assets/svg/svg1.svg'),
              ),
              const Padding(
                padding: EdgeInsets.all(28.0),
                child: DottedCircularProgressIndicatorWidget(
                    currentDotColor: Colors.purple,
                    defaultDotColor: Colors.greenAccent,
                    numDots: 9),
              )
            ],
          ),
        ),
      ),
    );
  }

  //fetch data
  _fetchData() {}

  // check
  _check() async {
    bool isLogged = await checkLoginBefore('token');
    if (isLogged) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  //
}
