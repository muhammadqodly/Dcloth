import 'components/body.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  static String routeName = "/event";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Event',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Body(),
    );
  }
}
