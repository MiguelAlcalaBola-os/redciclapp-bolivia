import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import "pdfs_admin.dart";
import '../services/acopiadora_services.dart';

class FormPDFs extends StatefulWidget {
  //RegisterRecicladora({Key key}) : super(key: key);

  @override
  State<FormPDFs> createState() => _FormPDFsState();
}

class _FormPDFsState extends State<FormPDFs> {
  final TextEditingController _NombrePDFController =
      TextEditingController();
  final TextEditingController _EnlacePDFController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Añadir PDF',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    controller: _NombrePDFController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.picture_as_pdf,
                        color: MaterialColors.mysecondary,
                      ),
                      helperText: 'Titulo de pdf',
                      labelText: 'Ingrese el titulo del pdf',
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
                    controller: _EnlacePDFController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.link,
                        color: MaterialColors.mysecondary,
                      ),
                      helperText: 'Link del pdf',
                      labelText: 'Ingrese el enlace web del pdf',
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
                Center(child: TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PDFs())),
                      
                  child: Text("Guardar PDF"),
                ) ,)
               
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
