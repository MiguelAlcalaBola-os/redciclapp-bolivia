import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/dashboard/getstarted.dart';
import 'package:material_kit_flutter/screens/home.dart';
//import 'package:material_kit_flutter/screens/home_screen.dart';
import 'package:material_kit_flutter/screens/reset_password.dart';
import 'package:material_kit_flutter/screens/signup_screen.dart';
import 'package:material_kit_flutter/services/authenticatorGoogle.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("000000"),
          hexStringToColor("023020"),
          hexStringToColor("000000")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/img/acercabtn.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Ingresar Usuario", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Ingresar Contraseña", Icons.lock_outline,
                    true, _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Iniciar Sesión", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                         
                      .then((value) {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                        }
                  
                  ).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });

                }
                ),
                firebaseUIButton(context, "Iniciar Sesión con Google",
                    () async {
                  User user =
                      await AuthenticatorGoogle.iniciarSesion(context: context);
                  print(user.displayName);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
                firebaseUIButton(context, "Iniciar Sesión con Facebook", () {
                  FirebaseAuth.instance
                
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),  
              
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container signUpOption() {
    return Container(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Quieres ofrecer servicios de reciclaje?",
              style: TextStyle(color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              " Registrarme",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Olvidaste tu contraseña?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
 
}


