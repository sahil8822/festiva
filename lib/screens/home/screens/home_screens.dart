import 'package:festivo/components/AppText.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: AppText(text: 'Home Screen')),
    );
  }
}
