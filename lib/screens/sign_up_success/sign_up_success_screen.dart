import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpSuccessScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  SignUpSuccessScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_up_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: SizedBox(),
      //   title: Text("Login Success"),
      // ),
      body: Body(),
    );
  }
}
