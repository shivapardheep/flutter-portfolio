import 'package:flutter/material.dart';

class MiniIntro extends StatelessWidget {
  const MiniIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String getAge() {
      int dob = 2002;
      int curYear = DateTime.now().year;
      return (curYear - dob).toString();
    }

    return Column(
      children: [
        const MiniText(event: 'Country', ans: 'India'),
        const MiniText(event: 'State', ans: 'TamilNadu'),
        MiniText(event: 'Age', ans: getAge()),
      ],
    );
  }
}

class MiniText extends StatelessWidget {
  final String event;
  final String ans;

  const MiniText({super.key, required this.event, required this.ans});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            event.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          Text(ans.toString()),
        ],
      ),
    );
  }
}
