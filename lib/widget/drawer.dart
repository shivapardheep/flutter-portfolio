import 'package:flutter/material.dart';

import '../components/coding.dart';
import '../components/drawer_bottom_widget.dart';
import '../components/drawer_header.dart';
import '../components/knowledge.dart';
import '../components/mini_intro.dart';
import '../components/skills.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeaderWidget(height: height),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MiniIntro(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Skill",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SkillsCircularAnimation(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Coding",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const Coding(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "Knowledge",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const Knowledge(),
                  const Divider(),
                  const DrawerBottomWidget(),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
