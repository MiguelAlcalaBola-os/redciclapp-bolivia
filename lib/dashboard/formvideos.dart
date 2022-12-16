import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/services/crud_services.dart';
import "videos_admin.dart";
import '../services/acopiadora_services.dart';

class FormVideo extends StatefulWidget {
  //RegisterRecicladora({Key key}) : super(key: key);

  @override
  State<FormVideo> createState() => _FormVideoState();
}

class _FormVideoState extends State<FormVideo> {
  final TextEditingController _nombreVideoController = TextEditingController();
  final TextEditingController _EnlaceVideoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Añadir Video',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: MaterialColors.myprimary,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {},
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            //que el boton vaya al fornmulario de recicladora
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    controller: _nombreVideoController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.music_video,
                        color: MaterialColors.mysecondary,
                      ),
                      helperText: 'Titulo de video',
                      labelText: 'Ingrese el titulo del video',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 136, 219, 182)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MaterialColors.mysecondary)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MaterialColors.mysecondary)),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MaterialColors.mysecondary)),
                    ),
                    validator: ((value) => (value))),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                    controller: _EnlaceVideoController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.link,
                        color: MaterialColors.mysecondary,
                      ),
                      helperText: 'Link del video',
                      labelText: 'Ingrese el enlace web del video',
                      labelStyle: TextStyle(color: MaterialColors.mysecondary),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MaterialColors.mysecondary)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MaterialColors.mysecondary)),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: MaterialColors.mysecondary)),
                    ),
                    validator: ((value) => (value))),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: TextButton(
                    onPressed: () async {
                      bool resp = await CRUDServices().guardarData({
                        'nombre': _nombreVideoController.text,
                        'enlace': _EnlaceVideoController.text,
                      }, 'Video');
                      if (resp) {
                        Navigator.pushReplacementNamed(context, '/videoadmin');
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Video registrado'),
                          backgroundColor: Colors.green,
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Algo salio mal'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: Text("Guardar Video"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // key: _scaffoldKey,
    );
  }
}
