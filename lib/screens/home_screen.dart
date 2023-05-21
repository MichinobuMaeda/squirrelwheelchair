import 'package:flutter/material.dart';

import '../slivers/main_app_bar.dart';
import '../slivers/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          MainAppBar(),
          Footer(),
        ],
      ),
    );
  }
}
