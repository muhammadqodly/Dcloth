import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';
import '../../donate/donate_screen.dart';
import '../../event/event_screen.dart';
import '../../galery/galery_screen.dart';
import '../../login_success/login_success_screen.dart';

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> features = [
      {"icon": "assets/icons/Gift Icon.svg", "text": "DONATE"},
      {"icon": "assets/icons/Parcel.svg", "text": "EVENT"},
      {"icon": "assets/icons/Camera Icon.svg", "text": "GALERY"}
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
            features.length,
            (index) => featuresCard(
                  icon: features[index]["icon"],
                  text: features[index]["text"],
                  press: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, DonateScreen.routeName);
                    } else if (index == 1) {
                      Navigator.pushNamed(context, EventScreen.routeName);
                    } else {
                      Navigator.pushNamed(context, GalleryScreen.routeName);
                    }
                  },
                ))
      ],
    );
  }
}

class featuresCard extends StatelessWidget {
  const featuresCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(60),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
