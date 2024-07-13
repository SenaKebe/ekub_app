import 'package:flutter/material.dart';
import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/screens/root/login_screen.dart';
import 'package:mobileapp/utils/shared_preferences.dart';

class IntroScreenWidget extends StatefulWidget {
  const IntroScreenWidget({super.key});

  @override
  State<IntroScreenWidget> createState() => _IntroScreenWidgetState();
}

class _IntroScreenWidgetState extends State<IntroScreenWidget> {
  final List<SingleIntroScreen> _slides = [
    SingleIntroScreen(
      title: 'Ekkub1',
      description: "ekub 1",
      headerWidget: SizedBox(
        child: SvgPicture.asset('assets/svg/svg1.svg'),
      ),
    ),
    SingleIntroScreen(
      title: 'Ekkub2',
      description: "ekub 2",
      headerWidget: SizedBox(
        child: SvgPicture.asset('assets/svg/svg1.svg'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
        slides: _slides,
        onDone: () {
          setData('intro', 'completed');
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => const LoginScreen(),
            ),
            (route) => false,
          );
        },
        isFullScreen: true,
        footerRadius: 16,
        doneText: "Done",
      ),
    );
  }
}
