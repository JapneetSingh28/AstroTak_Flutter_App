import 'package:flutter/material.dart';

import '../../utilities/size_config.dart';
import 'bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageOpacity = 0.0;
  @override
  void initState() {
    super.initState();
    loadNextScreen();
  }

  loadNextScreen() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      imageOpacity = 1.0;
      if (mounted) setState(() {});
    });

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, BottomNavigationScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: imageOpacity,
          child: Image.asset(
            'assets/icons/icon.png',
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
