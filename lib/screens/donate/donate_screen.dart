import 'components/body.dart';
import 'package:flutter/material.dart';

class DonateScreen extends StatelessWidget {
  static String routeName = "/donate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Donate',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Body(),
    );
  }
}
