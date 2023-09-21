import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gis9_flutter/constant/color.dart';
import 'package:gis9_flutter/screen/main_menu_screen.dart';
import 'package:gis9_flutter/screen/welcome_screen.dart';
import 'package:gis9_flutter/util/preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showOnboard = Preference.getBool(Preference.showOnboard)!;
  String? version;
  String? backendVersion;

  redirectPage(int duration) {
    Timer(Duration(seconds: duration), () {
      showOnboard
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainMenuScreen()));
    });
  }

  onLoading() async {
    redirectPage(1);
  }

  @override
  void initState() {
    super.initState();
    onLoading();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Put image here
            Padding(
              padding: EdgeInsets.all(30.0),
              child: LinearProgressIndicator(
                color: primaryColor,
                backgroundColor: whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
