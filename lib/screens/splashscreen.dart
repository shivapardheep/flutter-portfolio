import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sivaram_portfolio_web/screens/home_screen.dart';

import '../constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigationFunction() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false);
  }

  splashEffectFun() async {
    await Future.delayed(const Duration(seconds: 2));
    navigationFunction();
  }

  @override
  void initState() {
    super.initState();
    splashEffectFun();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      body: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: defaultDuration,
        builder: (BuildContext context, value, child) {
          return Center(
            child: SizedBox(
              height: 500,
              width: width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/icons/loading_4_dot.json",
                      height: 100, width: 100, repeat: true),

                  Text(
                    "Sivaram",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 20),
                  //   child: LinearProgressIndicator(
                  //     value: value,
                  //     color: primaryColor,
                  //     backgroundColor: darkColor,
                  //   ),
                  // ),
                  // Text(
                  //   "${(value * 100).toInt()}%",
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
