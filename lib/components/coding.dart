import 'package:flutter/material.dart';

import '../constants.dart';

class Coding extends StatelessWidget {
  const Coding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: const [
          LinearProgressWidget(percentage: 0.90, name: 'Dart'),
          LinearProgressWidget(percentage: 0.85, name: 'Python'),
          LinearProgressWidget(percentage: 0.70, name: 'Sql'),
          LinearProgressWidget(percentage: 0.60, name: 'C'),
        ],
      ),
    );
  }
}

class LinearProgressWidget extends StatelessWidget {
  final double percentage;
  final String name;

  const LinearProgressWidget(
      {super.key, required this.percentage, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: percentage),
          duration: defaultDuration,
          builder: (context, value, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "${(value * 100).toInt()}%",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: value,
                  color: primaryColor,
                  backgroundColor: darkColor,
                ),
              ],
            );
          }),
    );
  }
}
