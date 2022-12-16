import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/services/crud_services.dart';

class UpdateVideo extends StatefulWidget {
  const UpdateVideo({Key key, this.videoKey}) : super(key: key);

  final String videoKey;

  @override
  State<UpdateVideo> createState() => _UpdateVideoState();
}

class _UpdateVideoState extends State<UpdateVideo> {
  final String entidad = 'Video';
  final videoNombreController = TextEditingController();
  final videoEnlaceController = TextEditingController();
  Map dataVideo;

  DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child(entidad);
    getVideoData();
  }

  void getVideoData() async {
    dataVideo = await CRUDServices().getOneData(entidad, widget.videoKey);
    videoNombreController.text = dataVideo['nombre'];
    videoEnlaceController.text = dataVideo['enlace'];
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
                controller: videoNombreController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: 'Ingrese el título',
                  labelText: 'Título del Video',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: videoEnlaceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: 'Ingrese el link del video',
                  labelText: 'Enlace del video',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
                  bool resp = await CRUDServices().updateData(
                      context,
                      {
                        'nombre': videoNombreController.text,
                        'enlace': videoEnlaceController.text
                      },
                      entidad,
                      widget.videoKey);
                  if (resp) {
                    Navigator.pushReplacementNamed(context, '/videoadmin');
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Video actualizado'),
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
