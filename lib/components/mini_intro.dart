import 'package:flutter/material.dart';

class MiniIntro extends StatelessWidget {
  const MiniIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MiniText(event: 'Country', ans: 'India'),
        MiniText(event: 'State', ans: 'TamilNadu'),
        MiniText(event: 'Age', ans: '21'),
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
