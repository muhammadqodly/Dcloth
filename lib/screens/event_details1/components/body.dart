import 'package:dcloth/size_config.dart';
import 'package:flutter/material.dart';

import '../../donate/donate_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            // width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/war-6261976_1920 2.png"),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "65 DAYS LEFT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "TARGET DONATION 45 KG",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Text(
                      "Description: ",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                  Text(
                    'The results of your donation of clothes in "DONATE FORPALESTINE” will be sold at a garage sell and the proceeds from the sale will be donated directly to Palestine',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text(
                        "COMING SOON",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Text(
                        "DONATION FOR PALESTINE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, DonateScreen.routeName);
                  //     },
                  //     child: Text("DONATE"),
                  //   ),
                  // )
                ],
              )),
        ],
      ),
    );
  }
}
