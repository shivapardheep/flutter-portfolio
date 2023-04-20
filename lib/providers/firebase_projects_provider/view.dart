import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

class FirebaseProjectsProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FirebaseProjectsProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.read<FirebaseProjectsProvider>();

    return Container();
  }
}
