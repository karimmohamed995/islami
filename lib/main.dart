import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:islami/ui/screens/splash/splash.dart';
import 'package:islami/ui/screens/sura_details/sura_detials.dart';
import 'package:islami/ui/utilities/colors.dart';
import 'package:islami/ui/utilities/constants.dart';

void main() {
  AppConstants.fillSuras;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.routeName,
        theme: ThemeData(canvasColor: AppColors.gold),
        routes: {
          Splash.routeName: (_) => const Splash(),
          Home.routeName: (_) => const Home(),
          SuraDetials.routeName: (_) => const SuraDetials(),
        });
  }
}
