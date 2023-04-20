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
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  "https://res.cloudinary.com/dmty4l0o3/image/upload/v1681989797/images/profile/croped_aszfp7.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Lottie.asset(
                          "assets/icons/profile-completion-progress-bar.json",
                          height: 100,
                          width: 100,
                          repeat: false);
                    }
                  },
                ),
                // child: Lottie.asset(
                //     "assets/icons/profile-completion-progress-bar.json",
                //     height: 100,
                //     width: 100,
                //     repeat: false),
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
