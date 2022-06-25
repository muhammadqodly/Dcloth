import 'package:firebase_auth/firebase_auth.dart';

import '../../../components/default_button.dart';
import 'package:dcloth/size_config.dart';
import 'package:flutter/material.dart';

import '../../home/home_screen.dart';
import '../../sign_in/sign_in_screen.dart';

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        // ElevatedButton(
        //   onPressed: () async {
        //     final navigator = Navigator.of(context);
        //     await _auth.signOut();
        //     navigator.pushReplacementNamed(SignInScreen.routeName);
        //   },
        //   child: Text("KELUAR"),
        // ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 59, 82, 228),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text("To Home"),
              onPressed: () => Navigator.pushReplacementNamed(
                  context, HomeScreen.routeName)),
        ),
        Spacer(),
      ],
    );
  }
}
