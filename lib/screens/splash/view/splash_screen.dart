import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_text_field/screens/home/view/home_screen.dart';
import 'package:page_transition/page_transition.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splash: Column(
          children: [Image.asset("assets/images/splash_logo.png")],
        ),
        backgroundColor: Color(0xff121312),
        nextScreen:  HomeScreen(),
        splashIconSize: 250,
        duration: 2100,
        curve: Curves.bounceOut,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        animationDuration: Duration(seconds: 1),
      ),
    );
  }
}
