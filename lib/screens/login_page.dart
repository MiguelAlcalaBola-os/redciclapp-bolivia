import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material_kit_flutter/model/Auth.dart';
//import 'package:material_kit_flutter/screens/acercade.dart';
import 'package:material_kit_flutter/screens/home.dart';
//import 'package:material_kit_flutter/screens/options.dart';
import 'package:material_kit_flutter/screens/registration_screen.dart';
import 'package:material_kit_flutter/screens/reset_password.dart';
import 'package:material_kit_flutter/services/crud_services.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
//import "../dashboard/getstarted.dart";
import "onboardingAdmin.dart";
import '../utils/color_utils.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
  Firebase.initializeApp();
}

class LoginScreen extends StatefulWidget {
  void main() {
    runApp(MaterialApp(
      home: LoginScreen(),
    ));
    Firebase.initializeApp();
  }

  // const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String errorMessage;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    //email field
    final emailField = TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white.withOpacity(0.9)),
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return ("Por favor ingresa tu correo electrónico");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Por favor ingresa un correo válido");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Correo electrónico",
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ));

    //password field

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value.isEmpty) {
            return ("La contraseña es requerida");
          }
          if (!regex.hasMatch(value)) {
            return ("Ingresa una contraseña válida (Min. 6 caracteres)");
          }
        },
        onSaved: (value) {
          passwordController.text = value;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white.withOpacity(0.5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 34, 180, 114),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Iniciar sesión",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final GoogleButton = Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () async {
          User user = await Authenticador.iniciarSesion(context: context);
          if (user != null) {
            Fluttertoast.showToast(
                msg: "Sesión iniciada",
                textColor: Color.fromARGB(255, 254, 249, 249),
                backgroundColor: Color.fromARGB(255, 83, 80, 80));
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()));
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 11, 30, 11),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage("assets/img/google_logo.png"),
                height: 18.0,
                width: 24,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 8),
                child: Text(
                  'Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ),
    );

    // Material(
    //   elevation: 5,
    //   borderRadius: BorderRadius.circular(30),
    //   color: Color.fromARGB(255, 194, 194, 194),
    //   child: MaterialButton(
    //     padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     minWidth: MediaQuery.of(context).size.width,
    //     height: 21,
    //     onPressed: () async {
    //       User user = await Authenticador.iniciarSesion(context: context);
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(30, 11, 30, 11),
    //       child: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Image(
    //             image: AssetImage("assets/img/google_logo.png"),
    //             height: 18.0,
    //             width: 24,
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 24, right: 8),
    //             child: Text(
    //               'Google',
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 color: Colors.black54,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    final FacebookButton = Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () async {
          User user = await Authenticador.iniciarSesion(context: context);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 11, 30, 11),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage("assets/img/facebook_logo.png"),
                height: 18.0,
                width: 24,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 8),
                child: Text(
                  'Facebook',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
      ),
    );

    // Material(
    //   elevation: 15,
    //   // borderRadius: BorderRadius.circular(30),
    //   color: Color.fromARGB(255, 181, 181, 180),

    //   child: ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //       primary: Colors.white,
    //       onPrimary: Colors.black,
    //     ),
    //     onPressed: () {
    //       signIn(emailController.text, passwordController.text);
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(30, 11, 30, 11),
    //       child: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: const [
    //           Image(
    //             image: AssetImage("assets/img/facebook_logo.png"),
    //             height: 18.0,
    //             width: 24,
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 24, right: 8),
    //             child: Text(
    //               'Facebook',
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 color: Colors.black54,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MaterialDrawer(currentPage: "Login"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("000000"),
          hexStringToColor("023020"),
          hexStringToColor("000000")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 200,
                          child: Image.asset(
                            "assets/img/acercabtn.png",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(height: 45),
                      emailField,
                      SizedBox(height: 25),
                      passwordField,
                      SizedBox(height: 35),
                      forgetPassword(context),
                      loginButton,
                      SizedBox(height: 15),
                      GoogleButton,
                      SizedBox(height: 15),
                      FacebookButton,
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Quieres ofrecer servicios de reciclaje?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11),
                            ),
                            //         ),

                            //       ]),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                              child: Text(
                                " Registrarme",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 34, 180, 114),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Text(
                            //   "Quieres ofrecer servicios de reciclaje?",
                            //   style: TextStyle(
                            //       color: Color.fromARGB(255, 255, 255, 255),
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: 11),
                            // ),
                            //         ),

                            //       ]),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OnboardingAdmin()));
                              },
                              child: Text(
                                " PANEL ADMIN DE MUESTRA",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 110, 198, 158),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            )
                            // ],
                          ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    Firebase.initializeApp();
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(
                      msg: "Sesión iniciada",
                      textColor: Color.fromARGB(255, 254, 249, 249),
                      backgroundColor: Color.fromARGB(255, 83, 80, 80)),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage =
                "Su dirección de correo electrónico parece estar mal formada.";

            break;
          case "wrong-password":
            errorMessage = "Contraseña incorrecta";
            break;
          case "user-not-found":
            errorMessage =
                "El usuario(a) con este correo electrónico no existe.";
            break;
          case "user-disabled":
            errorMessage =
                "El usuario con este correo electrónico ha sido deshabilitado.";
            break;
          case "too-many-requests":
            errorMessage = "Demasiadas solicitudes";
            break;
          case "operation-not-allowed":
            errorMessage =
                "El inicio de sesión con correo electrónico y contraseña no está habilitado.";
            break;
          default:
            errorMessage = "Ocurrió un error indefinido.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Olvidaste tu contraseña?",
          style: TextStyle(color: Color.fromARGB(179, 64, 239, 5)),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
