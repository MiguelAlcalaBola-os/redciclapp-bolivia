import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/services/crud_services.dart';

class UpdatePdf extends StatefulWidget {
  const UpdatePdf({Key key, this.pdfKey}) : super(key: key);
  
  final String pdfKey;
  
  @override
  State<UpdatePdf> createState() => _UpdatePdfState();
}

class _UpdatePdfState extends State<UpdatePdf> {
  final String entidad = 'Pdf';
  final pdfNombreController = TextEditingController();
  final pdfEnlaceController = TextEditingController();
  Map dataPdf;

  DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child(entidad);
    getPdfData();
  }

  void getPdfData() async {

    dataPdf = await CRUDServices().getOneData(entidad, widget.pdfKey);
    pdfNombreController.text = dataPdf['nombre'];
    pdfEnlaceController.text = dataPdf['enlace'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar registro'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Actualizando registro',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: pdfNombreController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: 'Ingrese el título',
                  labelText: 'Título del PDF',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: pdfEnlaceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: 'Ingrese el link web del PDF',
                  labelText: 'Enlace del PDF',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                // onPressed: () {

                //   Map<String, String> pdfs = {
                //     'nombre': pdfNombreController.text,
                //     'enlace': pdfEnlaceController.text,
                //   };

                //   dbRef.child(widget.pdfKey).update(pdfs)
                //   .then((value) => {
                //     Navigator.pop(context)
                //   });

                // },

                onPressed: () async {
                  bool resp = await CRUDServices().updateData(
                      context,
                      {
                        'nombre': pdfNombreController.text,
                        'enlace': pdfEnlaceController.text
                      },
                      entidad,
                      widget.pdfKey);
                  if (resp) {
                    Navigator.pushReplacementNamed(context, '/pdfadmin');
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('PDF actualizado'),
                      backgroundColor: Colors.green,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Algo salio mal'),
                      backgroundColor: Colors.red,
                    ));
                  }
                },

                child: const Text('Actualizar Datos'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
