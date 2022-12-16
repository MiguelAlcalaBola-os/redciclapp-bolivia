import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {
  
  const UpdateRecord({Key key, this.studentKey}) : super(key: key);

  final String studentKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {

  final  recicladorNombreController = TextEditingController();
  final  recicladorCelularController= TextEditingController();
  final  recicladorResiduosController =TextEditingController();

  DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('recicla');
    getStudentData();
  }

  void getStudentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.studentKey).get();

    Map reciclador = snapshot.value as Map;

    recicladorNombreController.text = reciclador['nombre'];
    recicladorCelularController.text = reciclador['celular'];
    recicladorResiduosController.text = reciclador['residuos'];

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar registro'),
      ),
      body:  Center(
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
                controller: recicladorNombreController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre del reciclador/a',
                  hintText: 'Ingresa el nombre',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: recicladorCelularController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nro. de celular',
                  hintText: 'Ingresa el numero de celular',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: recicladorResiduosController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Residuos de recolecta',
                  hintText: 'Ingresa los residuos',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {

                  Map<String, String> students = {
                    'nombre': recicladorNombreController.text,
                    'celular': recicladorCelularController.text,
                    'residuos': recicladorResiduosController.text
                  };

                  dbRef.child(widget.studentKey).update(students)
                  .then((value) => {
                    Navigator.pop(context) 
                  });

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