import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  
  final  recicladorNombreController = TextEditingController();
  final  recicladorCelularController= TextEditingController();
  final  recicladorResiduosController =TextEditingController();

  DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('recicla');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Reciclador/a'),
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
                'Insertar datos del reciclador/a',
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
                  Map<String, String> reciclador = {
                    'nombre': recicladorNombreController.text,
                    'celular': recicladorCelularController.text,
                    'residuos': recicladorResiduosController.text
                  };

                  dbRef.push().set(reciclador);

                },
                child: const Text('Guardar Datos'),
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