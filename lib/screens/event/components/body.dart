import 'package:dcloth/screens/event_details2/event_detail_screen.dart';
import 'package:dcloth/size_config.dart';
import 'package:flutter/material.dart';

import '../../donate/donate_screen.dart';
import '../../event_details1/event_detail_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text(
                "Join Us!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Help each other",
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              eventCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class eventCard extends StatelessWidget {
  const eventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, EventDetailScreen1.routeName);
            },
            child: Image.asset(
              "assets/images/Plugin icon - 3.png",
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, EventDetailScreen2.routeName);
            },
            child: Image.asset(
              "assets/images/Plugin icon - 4.png",
            ),
          ),
        ],
      ),
    );
  }
}
