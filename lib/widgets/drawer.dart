import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_kit_flutter/screens/emprendimiento.dart';
import "../screens/form_recicladora.dart";
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/screens/onboarding.dart';

import 'package:material_kit_flutter/widgets/drawer-tile.dart';

class MaterialDrawer extends StatelessWidget {
  final String currentPage;

  MaterialDrawer({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(children: [
        DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 10, 126, 74)),
            child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      IconButton
                      (color: Colors.white,
                      icon: Icon(Icons.account_circle_sharp,
                      ),
                      onPressed: () =>
                       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  RegisterRecicladora()),
  )
                      ),
                    
                      SizedBox(width: 10.0,),
                      _nameUser(context)
                    ],
                  ),
                )
              ],
            ))),
        Expanded(
            child: ListView(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            DrawerTile(
                icon: Icons.home,
                onTap: () {
                  if (currentPage != "Home")
                    Navigator.pushReplacementNamed(context, '/home');
                },
                iconColor: MaterialColors.mysecondary,
                title: "Inicio",
                isSelected: currentPage == "Home" ? true : false),
            /* DrawerTile(
                icon: Icons.settings_input_component,
                onTap: () {
                  if (currentPage != "Components")
                    Navigator.pushReplacementNamed(context, '/components');
                },
                iconColor: Colors.black,
                title: "Components",
                isSelected: currentPage == "Components" ? true : false),
            DrawerTile(
                icon: Icons.account_circle,
                onTap: () {
                  if (currentPage != "Profile")
                    Navigator.pushReplacementNamed(context, '/profile');
                },
                iconColor: Colors.black,
                title: "Profile",
                isSelected: currentPage == "Profile" ? true : false),
            DrawerTile(
                icon: Icons.settings,
                onTap: () {
                  if (currentPage != "Settings")
                    Navigator.pushReplacementNamed(context, '/settings');
                },
                iconColor: Colors.black,
                title: "Settings",
                isSelected: currentPage == "Settings" ? true : false), */
            DrawerTile(
              icon: Icons.handyman,
              onTap: () {
                //if (currentPage != "Root")
                Navigator.pushReplacementNamed(context, '/options');
              },
              iconColor: MaterialColors.mysecondary,
              title: "Registrar Servicio",
              //isSelected: currentPage == "Root" ? true : false
            ),
            DrawerTile(
              icon: Icons.book,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/normativas');
              },
              iconColor: MaterialColors.mysecondary,
              title: "Normativa ambiental",
            ),
            DrawerTile(
              icon: Icons.info_outline_rounded,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/acercade');
              },
              iconColor: MaterialColors.mysecondary,
              title: "Acerca de Redcicla",
            ),
            DrawerTile(
              icon: Icons.logout,
              onTap: () {
                logout(context);
              },
              iconColor: MaterialColors.mysecondary,
              title: "Cerrar sesión",
            ),
          ],
        ))
      ])),
    );
  }

  StreamBuilder<User> _nameUser(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            var name = snapshot.data.email;
            return Text(name, style: TextStyle(
              color: Colors.white
            ),);
          } else {
            return Text('sin nomvew');
          }
        });
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(
        msg: "Sesión cerrada",
        textColor: Color.fromARGB(255, 254, 249, 249),
        backgroundColor: Color.fromARGB(255, 83, 80, 80));

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Onboarding()));
  }
}
