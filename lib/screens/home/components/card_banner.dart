import 'package:flutter/material.dart';

import '../../../size_config.dart';

class cardBanner extends StatelessWidget {
  const cardBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(15)),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
            text: "DONASI RUTIN TIAP MINGGU\n",
            style: TextStyle(color: Colors.white),
            children: [
              TextSpan(
                text: "FREE KAOS DCLOTH",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ]),
      ),
    );
  }
}
