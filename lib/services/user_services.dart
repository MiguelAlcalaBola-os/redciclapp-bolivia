import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../model/recicladora_model.dart';
import '../model/user_model.dart';

class UserServices {
  final firebaseRealTime = FirebaseDatabase.instance.ref();

  /* Future<List<UserModel>> getUser() async {
    var snapshot =
        await FirebaseFirestore.instance.collection('users').get();

    List<Recicladora> users = [];

    snapshot.docs.forEach((doc) {
      users.add(Recicladora.fromSnapshot(doc));
    });
    return users;
  } */
}
