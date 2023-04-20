import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      color: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/croped.jpeg"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sivaram Pr",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 10),
                Lottie.asset('assets/icons/verified.json',
                    repeat: false, height: 30, width: 30),
              ],
            ),
            const Text(
              "Flutter Developer | Mobile App Developer &\nFull Stack App Developer",
              textAlign: TextAlign.center,
              // style: TextStyle(fontWeight: FontWeight.w400, height: 1.5),
              overflow: TextOverflow.clip,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
