// import 'package:dcloth/screens/login_success/login_success_screen.dart';
// import 'package:dcloth/screens/sign_in/sign_in_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);

//   void setPreference() async {
//     final pref = await SharedPreferences.getInstance();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return LoginSuccessScreen();
//           } else {
//             return SignInScreen();
//           }
//         },
//       ),
//     );
//   }
// }
