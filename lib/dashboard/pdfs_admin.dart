// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/dashboard/update_pdf.dart';
import 'package:material_kit_flutter/services/crud_services.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../constants/Theme.dart';
import 'form_pdf.dart';
import "getstarted.dart";

//AQUI ESTAN LOS PDF
class PDFs extends StatefulWidget {
  const PDFs({Key key}) : super(key: key);

  @override
  State<PDFs> createState() => _PDFsState();
}

class _PDFsState extends State<PDFs> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Pdf');
  // DatabaseReference reference = FirebaseDatabase.instance.ref().child('Pdf');

  Widget listItem({Map pdf}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Color.fromARGB(255, 219, 219, 219),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  loadLink(pdf['enlace']);
                },
                child: Image(
                  image: AssetImage('assets/img/pdf.png'),
                  width: 50.0,
                  height: 50.0,
                ),
              ),

              Text(
                pdf['nombre'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              // Text(
              //   pdf['enlace'],
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => UpdatePdf(pdfKey: pdf['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () async {
                  final resp =
                      await CRUDServices().deleteData('Pdf', pdf['key']);
                  if (resp) {
                    print('Eliminado');
                  } else {
                    print('Ocurrio un error');
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SpeedDial(
            backgroundColor: Colors.lightGreenAccent,
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.add),
                  onTap: (() => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormPDFs()))),
                  label: "Añadir PDF",
                  backgroundColor: Colors.lightGreen),
              SpeedDialChild(
                  child: Icon(Icons.delete),
                  onTap: () {},
                  label: "Eliminar PDF",
                  backgroundColor: Colors.lightGreen),
              SpeedDialChild(
                  child: Icon(Icons.update),
                  onTap: () {},
                  label: "Renovar PDF",
                  backgroundColor: Colors.lightGreen)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(
              Icons.arrow_back_sharp,
              color: Color.fromARGB(255, 38, 201, 16),
            ),
            backgroundColor: MaterialColors.myprimary,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetStarted()));
            },
          ),
        ],
      ),
      appBar: Navbar(title: "PDFs"),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // key: _scaffoldKey,
      drawer: MaterialDrawer(currentPage: "Normativas"),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map pdf = snapshot.value as Map;
            pdf['key'] = snapshot.key;

            return listItem(pdf: pdf);
          },
        ),
      ),
    );
  }

  Future<void> loadLink(enlace) async {
    if (!await launchUrl(
      Uri.parse(enlace),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'No se pudo cargar en enlace: $enlace';
    }
  }
}




// body: Container(
          
//           padding: EdgeInsets.only(left: 10.0, right: 10.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
               
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Center(
//                         child: Column(
//                       children: [
                    
                        
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                              GestureDetector(
//                               onTap: loadLink,
//                               child: Card(
//                                 color: Color.fromARGB(255, 239, 238, 238),
//                                 elevation: 8.0,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(14.0)),
//                                 child: Column(
//                                   children: <Widget>[
//                                     Container(
//                                       padding: EdgeInsets.all(10.0),
//                                       width: 130.0,
//                                       height: 120.0,
//                                       child: Column(
//                                         children: [
//                                           Image(
//                                             image: AssetImage(
//                                                 'assets/img/pdf.png'),
//                                             width: 50.0,
//                                             height: 50.0,
//                                           ),
                                     
//                                           Text(
//                                             'PDF LEY 1',
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontWeight: FontWeight.w400),
//                                             textAlign: TextAlign.center,
//                                           ),
                                         
//                                         ],
                                        
//                                       ),
                                      
//                                     ),
//                                     Row(children: [   IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
//                                     IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
//                                      ],)
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 40.0,
//                             ),
//                               GestureDetector(
//                               onTap: loadLink,
//                               child: Card(
//                                 color: Color.fromARGB(255, 239, 238, 238),
//                                 elevation: 8.0,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(14.0)),
//                                 child: Column(
//                                   children: <Widget>[
//                                     Container(
//                                       padding: EdgeInsets.all(10.0),
//                                       width: 130.0,
//                                       height: 120.0,
//                                       child: Column(
//                                         children: [
//                                           Image(
//                                             image: AssetImage(
//                                                 'assets/img/pdf.png'),
//                                             width: 50.0,
//                                             height: 50.0,
//                                           ),
                                     
//                                           Text(
//                                             'PDF LEY 1',
//                                             style: TextStyle(
//                                                 fontSize: 13.0,
//                                                 fontWeight: FontWeight.w400),
//                                             textAlign: TextAlign.center,
//                                           ),
                                         
//                                         ],
                                        
//                                       ),
                                      
//                                     ),
//                                     Row(children: [   IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
//                                     IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
//                                      ],)
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
                        
//                   ],
//                 ),
//                 )],
//             ),
//           ]),)
//         )