import 'package:flutter/material.dart';
import 'package:gis9_flutter/constant/color.dart';
import 'package:gis9_flutter/screen/main_menu_screen.dart';
import 'package:gis9_flutter/util/preference.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _controller = PageController();
  bool _isLastPage = false;
  bool _isFirstPage = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState((() {
            _isLastPage = index == 3;
            _isFirstPage = index == 0;
          }));
        },
        children: [
          body(const Text(
              'Welcome to Pump It, your go-to app for hassle-free journeys! Locate nearby gas stations with ease and never worry about running out of fuel again.')),
          body(const Text(
              'Start your road trips on the right foot with Pump It, the reliable app that helps you find the nearest gas stations along your route, ensuring smooth travels ahead.')),
          body(const Text(
              'With Pump It, never stress about finding gas stations again. Whether youre on a road trip or simply navigating your city, weve got you covered with real-time fuel station locations.')),
          body(const Text(
              'Start saving time and money by using Pump It, the app that empowers you to locate the most affordable and convenient gas stations near you, ensuring a smooth ride every time')),
        ],
      ),
      bottomSheet: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _isFirstPage
                ? Padding(
                    padding: EdgeInsets.all(4.2.w),
                    child: TextButton(
                      onPressed: () {
                        _controller.animateToPage(4,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(4.2.w),
                    child: TextButton(
                      onPressed: () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
            Center(
              child: SmoothPageIndicator(
                count: 4,
                controller: _controller,
                effect: const WormEffect(
                    spacing: 16,
                    radius: 10,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: greyLess,
                    activeDotColor: primaryColor),
                onDotClicked: (index) => _controller.animateToPage(
                  index,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            _isLastPage
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.3.w),
                    child: TextButton(
                      onPressed: () {
                        Preference.setBool(Preference.showOnboard, false);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainMenuScreen()));
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.3.w),
                    child: TextButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget body(Text text1) {
    return backgroudImage(text1);
  }

  Widget backgroudImage(Text text1) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.4.w),
          child: Align(alignment: Alignment.center, child: text1),
        ),
      ),
    );
  }
}
