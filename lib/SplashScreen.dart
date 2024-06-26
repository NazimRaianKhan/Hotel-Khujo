import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hotel_khujo/Login.dart';
import 'package:page_transition/page_transition.dart';
class Splashscreen extends StatelessWidget{
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSplashScreen(
        splash: Image.asset('assets/logo1.png'),
        backgroundColor: Colors.white,
        nextScreen: const Login(),
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
    );
  }

}