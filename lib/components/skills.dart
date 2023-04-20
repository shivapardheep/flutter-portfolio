import 'package:flutter/material.dart';

import '../constants.dart';

class SkillsCircularAnimation extends StatelessWidget {
  const SkillsCircularAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(child: CircularWidget(percentage: 0.85, name: 'Flutter')),
          Expanded(child: CircularWidget(percentage: 0.75, name: 'Flask')),
          Expanded(child: CircularWidget(percentage: 0.65, name: 'Firebase')),
        ],
      ),
    );
  }
}

class CircularWidget extends StatelessWidget {
  final double percentage;
  final String name;

  const CircularWidget(
      {super.key, required this.percentage, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: percentage),
                    duration: defaultDuration,
                    builder: (BuildContext context, value, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: CircularProgressIndicator(
                              value: value,
                              color: primaryColor,
                              backgroundColor: darkColor,
                              strokeWidth: 3.5,
                            ),
                          ),
                          Positioned(
                            child: Text(
                              "${(value * 100).toInt()}%",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
