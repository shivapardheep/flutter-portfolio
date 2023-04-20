import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sivaram_portfolio_web/constants.dart';
import 'package:sivaram_portfolio_web/providers/firebase_projects_provider/provider.dart';
import 'package:sivaram_portfolio_web/responsive.dart';

import '../widget/drawer.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FirebaseProjectsProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerWidget(height: height),
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
            ),
      body: Row(
        children: [
          Responsive.isDesktop(context)
              ? Expanded(flex: 2, child: DrawerWidget(height: height))
              : Container(),
          const Expanded(flex: 7, child: MainScreen()),
        ],
      ),
    );
  }
}
