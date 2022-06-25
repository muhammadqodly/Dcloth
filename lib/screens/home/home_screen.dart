import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Body(),
    );
  }
}
