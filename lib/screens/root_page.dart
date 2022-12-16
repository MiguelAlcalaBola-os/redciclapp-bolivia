import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/screens/home.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/screens/options.dart';

class RootPage extends StatelessWidget {
  //const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
