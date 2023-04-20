import 'package:flutter/material.dart';
import 'package:sivaram_portfolio_web/responsive.dart';

import '../components/banner.dart';
import '../components/middile_number_widget.dart';
import '../components/my_projects.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 15 : 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BannerWidget(),
            MiddleNumbersWidget(),
            MyProjectsWidget(),
          ],
        ),
      ),
    );
  }
}
