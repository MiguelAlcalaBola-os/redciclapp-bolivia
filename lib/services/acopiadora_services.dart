

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../main.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class AcopiadoraServices {
  BuildContext get context => null;


  Future<bool> guardarAcopiadora(
    
    String uid,
      String nombreCompleto,
      String comboCiudad,
      String comboZona,
      String hoy,
      String celular,
      String horarios,
      String residuos,
      String direccion,
      String detalle,
      String em) async {
    try {
      await FirebaseDatabase.instance.ref().child('acopio'+ uid).push().set({


       [uid = _uidUser.toString()]:
       
       {
         'nombre': nombreCompleto,
        'ciudad': comboCiudad,
        'zona': comboZona,
        'fecha': hoy,
        'celular': celular,
        'horarios': horarios,
        'querecibe': residuos,
        'direccion': direccion,
        'detalles':detalle,
        'correo': em
       } 
       
      });
      print(User);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  
  StreamBuilder<User> _uidUser(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            var name = snapshot.data.uid;
            return Text(name, style: TextStyle(
              color: Colors.white
            ),);
          } else {
            return Text('sin nomvew');
          }
        });
  }
}
