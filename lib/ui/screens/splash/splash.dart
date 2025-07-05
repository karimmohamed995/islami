import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/ui/screens/home/home.dart';
import 'package:islami/ui/screens/home/onboarding_screens.dart';
import 'package:islami/ui/utilities/assets.dart';

class Splash extends StatelessWidget {
  static const routeName = "splash";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    });
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          AppAssets.splashImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
