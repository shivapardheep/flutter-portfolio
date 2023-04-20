import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sivaram_portfolio_web/responsive.dart';

import '../constants.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    super.key,
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  bool _isEnableConfetti = false;
  confettiFun() async {
    setState(() {
      _isEnableConfetti = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isEnableConfetti = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      // fit: StackFit.expand,
      children: [
        AspectRatio(
          aspectRatio: Responsive.isMobile(context) ? 2.1 : 3,
          child: Image.asset(
            "assets/images/bg.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        AspectRatio(
          aspectRatio: Responsive.isMobile(context) ? 2.1 : 3,
          child: Container(
            color: darkColor.withOpacity(0.66),
          ),
        ),
        Positioned(
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover my Amazing \nArt Space",
                  style: Responsive.isMobileLarge(context)
                      ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)
                      : Responsive.isMobile(context)
                          ? Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)
                          : Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Responsive.isMobile(context)
                        ? Container()
                        : RichText(
                            text: const TextSpan(
                                text: "<",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "Flutter",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                    text: ">",
                                  ),
                                ]),
                          ),
                    const SizedBox(width: 10),
                    DefaultTextStyle(
                      style: Responsive.isMobile(context)
                          ? Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white54)
                          : Theme.of(context).textTheme.titleMedium!,
                      child: Column(
                        children: [
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TyperAnimatedText(
                                  "I build Android & Ios with Web Applications"),
                              TyperAnimatedText(
                                  "i am a Full Stack Dpp Developer"),
                              TyperAnimatedText(
                                  "I can build Responsive Applications"),
                              TyperAnimatedText(
                                  "Native Application Developer."),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Responsive.isMobile(context)
                        ? Container()
                        : RichText(
                            text: const TextSpan(
                                text: "<",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "Flutter",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                    text: ">",
                                  ),
                                ]),
                          ),
                  ],
                ),
                Responsive.isMobileLarge(context)
                    ? const SizedBox(height: 10)
                    : const SizedBox(height: 20),
                Responsive.isMobile(context)
                    ? Container()
                    : SizedBox(
                        height: Responsive.isMobileLarge(context) ? 30 : 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            confettiFun();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor),
                          child: const Text(
                            "EXPLORE NOW",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
        _isEnableConfetti
            ? AspectRatio(
                aspectRatio: Responsive.isMobile(context) ? 2.1 : 3,
                child:
                    Lottie.asset("assets/icons/confetti_1.json", repeat: true))
            : const Text(""),
      ],
    );
  }
}
