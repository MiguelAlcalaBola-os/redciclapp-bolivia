// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../model/recicladora_model.dart';
import 'package:flutter/material.dart';

class CRUDServices {
  final firebaseRealTime = FirebaseDatabase.instance.ref();
  
  // Future<List<Recicladora>> getPdf() async {
  //   var snapshot =
  //       await FirebaseFirestore.instance.collection('recicladoras').get();

  //   List<Recicladora> recicladoras = [];

  //   snapshot.docs.forEach((doc) {
  //     recicladoras.add(Recicladora.fromSnapshot(doc));
  //   });
  //   return recicladoras;
  // }

  Future<bool> guardarData(Object data, String table) async {
    try {
      await FirebaseDatabase.instance.ref().child(table).push().set(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateData(
      BuildContext context, Object data, String table, key) async {
    try {
      await FirebaseDatabase.instance
          .ref()
          .child(table)
          .child(key)
          .update(data)
          .then((value) => {Navigator.pop(context)});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map> getOneData(String table, key) async {
    try {
      DataSnapshot snapshot =
          await FirebaseDatabase.instance.ref().child(table).child(key).get();
      Map dataMap = snapshot.value as Map;
      return dataMap;
    } catch (e) {
      print(e);
      return {};
    }
  }

  Future<bool> deleteData(String table, key) async {
    try {
      await FirebaseDatabase.instance.ref().child(table).child(key).remove();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Query> getAllData(String table) async {
    try {

      Query dbRef = FirebaseDatabase.instance.ref().child(table);

      
      return dbRef;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
