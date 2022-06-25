import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Spacer(),
      // Text(
      //   "Dcloth",
      //   style: TextStyle(
      //       fontSize: getProportionateScreenWidth(36),
      //       color: kPrimaryColor,
      //       fontWeight: FontWeight.bold),
      // ),
      Image.asset(image),

      Text(
        text,
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
