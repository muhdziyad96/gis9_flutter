import 'package:flutter/material.dart';
import 'package:gis9_flutter/screen/splash_screen.dart';
import 'package:gis9_flutter/util/preference.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference.init();
  Preference.getBool(Preference.showOnboard) ??
      Preference.setBool(Preference.showOnboard, true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        title: 'GIS9 Mobile',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
