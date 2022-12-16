import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import "formuser.dart";
import "getstarted.dart";
import "../screens/options.dart";
import '../screens/options.dart';
class Users extends StatefulWidget {
//AQUI SE DEBEN TRABAJAR EL ARRAY DE USUSARIOS SACADOS DE LA BASE DE DATOS EN FIREBASE
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<String> users = List.generate(100, (index) => "Usuario${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) =>OptionsPage())),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => GetStarted())),
          ),
        ],
      ),
      appBar: AppBar(
          title: Text(
        "Lista de usuarios",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      )),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final item = users[index];
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          );
          return ListTile(
            iconColor: Colors.red,
            title: Text(item),
            trailing: Icon(Icons.delete),
            onTap: () {
              //PONER AQUI EL METODO QUE NECESITE
            },
            // leading: IconButton(
            //   icon: Icon(
            //     Icons.edit,
            //   ),
            //   alignment: Alignment.center,
            // ),
          );
        },
      ),
    );
  }
}
