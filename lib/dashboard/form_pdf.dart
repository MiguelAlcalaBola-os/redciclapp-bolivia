import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/services/crud_services.dart';
import 'package:material_kit_flutter/services/pdf_services.dart';
import "pdfs_admin.dart";
// import '../services/acopiadora_services.dart';

class FormPDFs extends StatefulWidget {
  //RegisterRecicladora({Key key}) : super(key: key);

  @override
  State<FormPDFs> createState() => _FormPDFsState();
}

class _FormPDFsState extends State<FormPDFs> {
  final TextEditingController _NombrePDFController = TextEditingController();
  final TextEditingController _EnlacePDFController = TextEditingController();

  final GlobalKey<FormState> _formPdf = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Añadir PDF',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(20, 91, 59, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/pdfadmin');
            },
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // key: _scaffoldKey,
        body: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.hasData);
              var email = snapshot.data.email;
              return formularioPdf(email);
            } else {
              return LoginScreen();
            }
          },
        ));
  }

  Widget formularioPdf(String email) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formPdf,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _nombrePdf(),
              SizedBox(
                height: 15.0,
              ),
              _enlacePdf(),
              SizedBox(
                height: 10.0,
              ),
              _registerButton(),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nombrePdf() {
    return TextFormField(
        controller: _NombrePDFController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.account_circle,
            color: MaterialColors.mysecondary,
          ),
          helperText: 'Ingrese el título',
          labelText: 'Título del PDF',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorLlenarCampo(value)));
  }

  Widget _enlacePdf() {
    return TextFormField(
        controller: _EnlacePDFController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.article,
            color: MaterialColors.mysecondary,
          ),
          helperText: 'Ingrese el link web del PDF',
          labelText: 'Enlace del PDF',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorLlenarCampo(value)));
  }

  Widget _registerButton() {
    // var _em = email;
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: MaterialColors.mysecondary,
            minimumSize: const Size(180.0, 40.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () async {
            if (_formPdf.currentState.validate()) {
              bool resp = await CRUDServices().guardarData({
                'nombre': _NombrePDFController.text,
                'enlace': _EnlacePDFController.text,
              }, 'Pdf');
              if (resp) {
                Navigator.pushReplacementNamed(context, '/pdfadmin');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('PDF registrado'),
                  backgroundColor: Colors.green,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Algo salio mal'),
                  backgroundColor: Colors.red,
                ));
              }
            }
          },
          child: Text('Guardar', style: TextStyle(color: Colors.white))),
    );
  }

  String _validatorLlenarCampo(String value) {
    if (!_minLength(value)) {
      return 'Por favor llene este campo';
    }
  }

  bool _minLength(String value) {
    return value.isNotEmpty && value.length >= 4;
  }
}









//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 TextFormField(
//                     controller: _NombrePDFController,
//                     decoration: const InputDecoration(
//                       icon: Icon(
//                         Icons.picture_as_pdf,
//                         color: MaterialColors.mysecondary,
//                       ),
//                       helperText: 'Titulo de pdf',
//                       labelText: 'Ingrese el titulo del pdf',
//                       labelStyle:
//                           TextStyle(color: Color.fromARGB(255, 136, 219, 182)),
//                       enabledBorder: UnderlineInputBorder(
//                           borderSide:
//                               BorderSide(color: MaterialColors.mysecondary)),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide:
//                               BorderSide(color: MaterialColors.mysecondary)),
//                       border: UnderlineInputBorder(
//                           borderSide:
//                               BorderSide(color: MaterialColors.mysecondary)),
//                     ),
//                     validator: ((value) => (value))),
//                 SizedBox(
//                   height: 15.0,
//                 ),
//                 TextFormField(
//                     controller: _EnlacePDFController,
//                     decoration: const InputDecoration(
//                       icon: Icon(
//                         Icons.link,
//                         color: MaterialColors.mysecondary,
//                       ),
//                       helperText: 'Link del pdf',
//                       labelText: 'Ingrese el enlace web del pdf',
//                       labelStyle: TextStyle(color: MaterialColors.mysecondary),
//                       enabledBorder: UnderlineInputBorder(
//                           borderSide:
//                               BorderSide(color: MaterialColors.mysecondary)),
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide:
//                               BorderSide(color: MaterialColors.mysecondary)),
//                       border: UnderlineInputBorder(
//                           borderSide:
//                               BorderSide(color: MaterialColors.mysecondary)),
//                     ),
//                     validator: ((value) => (value))),
//                 SizedBox(
//                   height: 15.0,
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 // Center(child: TextButton(
//                 //   onPressed: () => Navigator.push(context,
//                 //       MaterialPageRoute(builder: (context) => PDFs())),
                      
//                 //   child: Text("Guardar PDF"),
//                 // ) ,)

                
               
//               ],
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       // key: _scaffoldKey,
//     );
//   }
// }
