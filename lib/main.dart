import 'package:dcloth/constants.dart';
import 'package:dcloth/database.dart';
import 'package:dcloth/main_page.dart';
import 'package:dcloth/routs.dart';
import 'package:dcloth/screens/event_details2/event_detail_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:dcloth/routes.dart';
// import 'package:dcloth/screens/profile/profile_screen.dart';
import 'package:dcloth/screens/splash/splash_screen.dart';

import 'package:dcloth/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),

      // home: MainPage(),

      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
