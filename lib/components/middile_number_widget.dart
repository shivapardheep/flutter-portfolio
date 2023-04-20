import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';

class MiddleNumbersWidget extends StatelessWidget {
  const MiddleNumbersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Responsive.isMobileLarge(context) || Responsive.isMobile(context)
          ? smallScreenView()
          : bigScreenView(),
    );
  }

  Row smallScreenView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            NumberAnimationsWidget(percentage: 10, type: 'percentage'),
            NumberAnimationsWidget(percentage: 15, type: 'Github projects'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            NumberAnimationsWidget(percentage: 7, type: 'Ui Designs'),
            NumberAnimationsWidget(percentage: 4, type: 'Languages'),
          ],
        ),
      ],
    );
  }

  Row bigScreenView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        NumberAnimationsWidget(percentage: 10, type: 'percentage'),
        NumberAnimationsWidget(percentage: 15, type: 'Github projects'),
        NumberAnimationsWidget(percentage: 7, type: 'Ui Designs'),
        NumberAnimationsWidget(percentage: 4, type: 'Languages'),
      ],
    );
  }
}

class NumberAnimationsWidget extends StatelessWidget {
  final double percentage;
  final String type;

  const NumberAnimationsWidget(
      {super.key, required this.percentage, required this.type});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: percentage),
      duration: defaultDuration,
      builder: (BuildContext context, value, child) {
        return LittleNumbers(number: value.toInt(), name: type);
      },
    );
  }
}

class LittleNumbers extends StatelessWidget {
  final int number;
  final String name;

  const LittleNumbers({super.key, required this.number, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$number+",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: primaryColor, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Text(name,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15)),
      ],
    );
  }
}
