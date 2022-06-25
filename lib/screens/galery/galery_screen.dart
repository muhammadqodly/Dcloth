import 'package:flutter/material.dart';

import 'components/body.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  static String routeName = "/galeri";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Gallery',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Body(),
    );
  }
}

// import 'package:gallery_view/gallery_view.dart';

// class GaleryPage extends StatelessWidget {
//   static String routeName = '/galery';
//   const GaleryPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: GalleryView(
//           imageUrlList: [
//             "https://images.unsplash.com/photo-1500100586562-f75ff6540087?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
//           ],
//           key: Key('gallery'),
//         ),
//       ),
//     );
//   }
// }
