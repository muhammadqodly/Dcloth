import 'package:dcloth/constants.dart';
import 'package:dcloth/screens/home/home_screen.dart';
import 'package:dcloth/screens/profile/profile_page.dart';
import 'package:dcloth/screens/sign_in/sign_in_screen.dart';
import 'package:dcloth/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'card_banner.dart';
import 'content_for_you.dart';
import 'features.dart';
import 'section_title.dart';

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  //final User? user = _auth.currentUser;
  Body({Key? key}) : super(key: key);
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: SizeConfig.screenWidth * 0.6,
                    height: 30,
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // ignore: prefer_const_constructors
                    child: StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.userChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              ' Hello ${snapshot.data?.email}',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            );
                          } else {
                            return const Text('Anda belum memiliki akun');
                          }
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ProfilePage.routeName);
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Stack(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(12)),
                          height: getProportionateScreenWidth(46),
                          width: getProportionateScreenWidth(46),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("assets/icons/User.svg"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              cardBanner(),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              // SUBJUDUL
              Text("FEATURES"),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Features(),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),

              contentForYou(),

              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 59, 82, 228),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () async {
                    final navigator = Navigator.of(context);
                    await _auth.signOut();
                    navigator.pushReplacementNamed(SignInScreen.routeName);
                  },
                  child: Text("KELUAR"),
                ),
              ),
            ],
          )),
    );
  }
}
