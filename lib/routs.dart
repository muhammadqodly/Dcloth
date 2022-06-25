// import 'dart:js';

import 'package:dcloth/screens/donate/donate_screen.dart';
import 'package:dcloth/screens/event/event_screen.dart';
import 'package:dcloth/screens/event_details1/event_detail_screen.dart';
import 'package:dcloth/screens/event_details2/event_detail_screen.dart';
import 'package:dcloth/screens/galery/galery_screen.dart';
import 'package:dcloth/screens/home/home_screen.dart';
import 'package:dcloth/screens/login_success/login_success_screen.dart';
import 'package:dcloth/screens/profile/profile_page.dart';
import 'package:dcloth/screens/sign_in/sign_in_screen.dart';
import 'package:dcloth/screens/sign_up/sign_up_screen.dart';
import 'package:dcloth/screens/sign_up_success/sign_up_success_screen.dart';
import 'package:dcloth/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
//import 'package:gallery_view/gallery_view.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DonateScreen.routeName: (context) => DonateScreen(),
  EventScreen.routeName: (context) => EventScreen(),
  ProfilePage.routeName: (context) => ProfilePage(),
  GalleryScreen.routeName: (context) => GalleryScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  EventDetailScreen1.routeName: (context) => EventDetailScreen1(),
  EventDetailScreen2.routeName: (context) => EventDetailScreen2(),
  SignUpSuccessScreen.routeName: (context) => SignUpSuccessScreen(),
};
