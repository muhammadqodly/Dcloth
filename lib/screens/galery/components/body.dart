import 'package:dcloth/main_page.dart';
import 'package:dcloth/size_config.dart';
import 'package:flutter/material.dart';

import '../../donate/donate_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          // padding: const EdgeInsets.all(8),
          // color: Colors.teal[300],
          child: Image.asset('assets/images/clothes.jpg'),
        ),
        Container(
          // padding: const EdgeInsets.all(8),
          // color: Colors.teal[300],
          child: Image.asset(
              'assets/images/sarah-brown-oa7pqZmmhuA-unsplash-copy.jpg'),
        ),
        Container(
          // padding: const EdgeInsets.all(8),
          // color: Colors.teal[300],
          child: Image.asset(
              'assets/images/clothes-donation-concept-box-cloth-with-donate-label-preparing-used-old-garment-home-top-view_34048-1822.webp'),
        ),
        Container(
          // padding: const EdgeInsets.all(8),
          // color: Colors.teal[300],
          child: Image.asset(
              'assets/images/RS23290_GettyImages-946938998-scr.jpg'),
        ),
        Container(
          // padding: const EdgeInsets.all(8),
          // color: Colors.teal[300],
          child: Image.asset('assets/images/donate-your-old-cloths.png'),
        ),
        Container(
          // padding: const EdgeInsets.all(8),
          // color: Colors.teal[300],
          child: Image.asset(
              'assets/images/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2018__09__DumpedClothesShutterstock-733c1832cbbe497e867f9f9d99455f1f.jpg'),
        ),
      ],
    );
  }
}
