import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_kit_flutter/dashboard/getstarted.dart';
import './screens/home.dart';
import './screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/dashboard/form_pdf.dart';
import 'package:material_kit_flutter/dashboard/pdfs_admin.dart';
import 'package:material_kit_flutter/dashboard/users_admin.dart';
import 'package:material_kit_flutter/dashboard/videos_admin.dart';
import 'package:material_kit_flutter/screens/acercade.dart';
import 'package:material_kit_flutter/screens/acopios.dart';
import 'package:material_kit_flutter/screens/details_recicladora.dart';
import 'package:material_kit_flutter/screens/emprendimiento.dart';
import 'package:material_kit_flutter/screens/fetch_data.dart';
import 'package:material_kit_flutter/screens/form_acopiadora.dart';
import 'package:material_kit_flutter/screens/form_ecoemprendimiento.dart';
import 'package:material_kit_flutter/screens/form_recicladora.dart';

// screens
import 'package:material_kit_flutter/screens/home.dart';
import 'package:material_kit_flutter/screens/insert_data.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/screens/onboarding.dart';
import 'package:material_kit_flutter/screens/options.dart';
import 'package:material_kit_flutter/screens/profile.dart';
import 'package:material_kit_flutter/screens/recicladorabase.dart';
import 'package:material_kit_flutter/screens/root_page.dart';
import 'package:material_kit_flutter/screens/settings.dart';
import 'package:material_kit_flutter/screens/components.dart';
import 'package:material_kit_flutter/screens/pro.dart';
import 'package:material_kit_flutter/screens/normativas.dart';
import 'package:material_kit_flutter/screens/signin_screen.dart';
import 'package:material_kit_flutter/screens/update_date.dart';
import 'package:material_kit_flutter/screens/videos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "RedCiclapp",
      home: mainpage(),
    );
  }
}

class mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/pro": (BuildContext context) => new Pro(),
          "/home": (BuildContext context) => new Home(),
          "/components": (BuildContext context) => new Components(),
          "/profile": (BuildContext context) => new Profile(),
          "/settings": (BuildContext context) => new Settings(),
          "/acopios": (BuildContext context) => new AcopioPage(),
          "/acercade": (BuildContext context) => new AcercaDePage(),
          "/normativas": (BuildContext context) => new NormativasRedciclaPage(),
          "/videos": (BuildContext context) => new VideosRedciclaPage(),
          "/recicladora": (BuildContext context) => new RecicladoraBasePage(),
          "/ecoempren": (BuildContext context) => new EcoEmprendimientoPage(),
          "/login": (BuildContext context) => new LoginScreen(),
          "/options": (BuildContext context) => new OptionsPage(),
          "/root": (BuildContext context) => new RootPage(),
          "/formrecicladora": (BuildContext context) =>
              new RegisterRecicladora(),
          "/formacopiadora": (BuildContext context) => new RegisterAcopiadora(),
          "/formecoempren": (BuildContext context) =>
              new RegisterEcoemprendimiento(),
          "/details": (BuildContext context) => new DetailsPage(),
          "/login2": (BuildContext context) => new SignInScreen(),
          "/insert": (BuildContext context) => new InsertData(),
          "/update": (BuildContext context) => new UpdateRecord(),
          "/fetch": (BuildContext context) => new FetchData(),
          "/pdfadmin": (BuildContext context) => new PDFs(),
          "/formpdf": (BuildContext context) => new FormPDFs(),
          "/videoadmin": (BuildContext context) => new VideosAdmin(),
          "/useradmin": (BuildContext context) => new Users()
        },
        // ScaffoldMessengerState: snackbar.messengerKey,
        home: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //print(snapshot);
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("algo salio mal"));
            } else if (snapshot.hasData) {
              //print(esAdmin(snapshot.data.uid).toString());
              //var rol = esAdmin(snapshot.data.uid);
              //print('aqui ' + rol.toString());
              // if (rol.toString() == 'true') {
              return Home();
              // } else {
              //return Home();
              // }
            } else {
              return LoginScreen();
            }
          },
        ));
  }

  Future<bool> esAdmin(String userUid) async {
    var resp = 'Usuario';
    try {
      DataSnapshot snapshot =
          await FirebaseDatabase.instance.ref().child("Usuarios").get();

      var obj = snapshot.value.toString().contains(userUid);
      // if (obj) {
      //   resp = 'Admin';
      // }
      return Future.value(obj);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }
}
