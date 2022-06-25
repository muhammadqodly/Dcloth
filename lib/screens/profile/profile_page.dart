import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = "/profile";
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50, bottom: 50),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.amber,
              ),
              child: Image.asset(
                "assets/images/150-1503945_transparent-user-png-default-user-image-png-png.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Image.asset('assets/icons/user.png'),
            title: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      'User ${snapshot.data?.uid}',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    );
                  } else {
                    return const Text('Anda belum memiliki akun');
                  }
                }),
          ),
          const Divider(color: Colors.green, endIndent: 16, indent: 16),
          ListTile(
            leading: Image.asset('assets/icons/mail.png'),
            title: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data?.email}',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    );
                  } else {
                    return const Text('Anda belum memiliki akun');
                  }
                }),
          ),
          const Divider(color: Colors.green, endIndent: 16, indent: 16),
        ],
      ),
    );
  }
}
