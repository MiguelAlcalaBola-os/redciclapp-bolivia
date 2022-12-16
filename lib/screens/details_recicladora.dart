import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:material_kit_flutter/model/recicladora_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class RIKeys {
  static final riKey1 = const Key('_RIKEY1_');
  static final riKey2 = const Key('_RIKEY2_');
  static final riKey3 = const Key('_RIKEY3_');
  static final riKey4 = const Key('_RIKEY4_');
  static final riKey5 = const Key('_RIKEY5_');
  static final riKey6 = const Key('_RIKEY6_');
  static final riKey7 = const Key('_RIKEY7_');
  static final riKey8 = const Key('_RIKEY8_');
}

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  File _imageFile;
  ScreenshotController _ScreenshotController = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void>_takeScreenshot() async {
    final image =
        await _ScreenshotController.capture(delay: Duration(milliseconds: 10),pixelRatio: 2);
    final File _imageFile = File.fromRawPath(image);
    Share.shareFiles([_imageFile.path]);
  }

  @override
  Widget build(BuildContext context) {
    final Recicladora recicladora =
        ModalRoute.of(context).settings.arguments as Recicladora;

    return Screenshot(
      controller: _ScreenshotController,
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              elevation: 30,
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            backgroundColor: Color.fromARGB(255, 228, 162, 41),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/recicladora');
            },
      ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            _fondoapp(),
            SingleChildScrollView(
              child: Column(children: <Widget>[
                _header(recicladora),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15, top: 80, left: 10, right: 10),
                  child: _Row1(recicladora),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _header(Recicladora recicladora) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 45),
            child: Column(
              children: <Widget>[
                Text(
                  recicladora.nombre,
                  style: TextStyle(
                      color: Color.fromRGBO(34, 181, 115, 1.0),
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Reciclador/a de Base',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ))
      ],
    );
  }

  Widget _Row1(Recicladora recicladora) {
    return Table(
      children: [
        TableRow(key: RIKeys.riKey1, children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Departamento: ' + recicladora.departamento,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zona: ' + recicladora.zona,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          )
        ]),
        TableRow(key: RIKeys.riKey2, children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¿Qué recolecta?',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  recicladora.recolecta,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¿Qué dia(s)?',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  recicladora.dias,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ]),
        TableRow(key: RIKeys.riKey3, children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Horarios',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  recicladora.horarios,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(15),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 37, 211, 102)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  label: Text(
                    "Contactar",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.whatsapp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _escribirWhatsapp(recicladora.celular, recicladora.nombre);
                  },
                ),
              ],
            ),
          ),
        ]),
        TableRow(key: RIKeys.riKey4, children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ruta:',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  recicladora.ruta,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(15),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 29, 161, 242)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  label: Text(
                    "  Llamar   ",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.phone_callback_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _hacerLlamada(recicladora.celular);
                  },
                ),
              ],
            ),
          ),
        ]),
        TableRow(key: RIKeys.riKey5, children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detalle:',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  recicladora.recolecta,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(15),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 228, 162, 41)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  label: Text(
                    "Compartir",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  Widget _fondoapp() {
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(top: -180.0, child: cajaBlanca),
        Positioned(bottom: -200.0, child: cajaLogo)
      ],
    );
  }

  final gradiente = Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.5),
            end: FractionalOffset(0.0, 1.0),
            colors: [Color.fromRGBO(34, 181, 115, 1.0), Colors.green])),
  );

  final cajaBlanca = Transform.rotate(
    angle: -3.1415926535897932 / 6.0,
    child: Container(
      height: 280,
      width: 380,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(85),
          gradient: LinearGradient(colors: [Colors.white, Colors.white])),
    ),
  );
  final cajaLogo = Transform.rotate(
      angle: -3.1415926535897932 / 6.0,
      child: Stack(
        children: <Widget>[
          Container(
              height: 250.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(85),
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                ),
              )),
          Positioned(
            top: 25.0,
            right: 10,
            child: Transform.rotate(
              angle: 3.1415926535897932 / 6,
              child: Image(
                image: AssetImage('assets/img/iniciobanner.jpg'),
                height: 60,
              ),
            ),
          )
        ],
      ));

  Future<void> _hacerLlamada(String number) async {
    final Uri launchUri = Uri(scheme: 'tel', path: number);
    await launchUrl(launchUri);
  }

  Future<void> _escribirWhatsapp(String number, String name) async {
    final String numero = number;
    final String nombre = name;

    final Uri _url = Uri.parse(
        "whatsapp://send?phone=$numero&text=Buenos dias recicladora $nombre");

    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}

/* Scaffold(
      appBar: AppBar(
        title: Text(
          'Recicladora',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: MaterialColors.myprimary,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            infor("Nombre de recicladora", recicladora.nombre),
            infor("Departamento", recicladora.departamento),
            infor("Zona", recicladora.zona),
            infor("Dias de recoleccion", recicladora.dias),
            infor("Horarios de recolecta", recicladora.horarios),
            infor("Que recolecto?", recicladora.recolecta),
            infor("Cual es mi ruta?", recicladora.ruta),
            llamar(recicladora.celular, recicladora.nombre)
          ],
        )),
      ),
    );
  }

  Widget infor(texto, valor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        title: Text(
          texto,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(valor, style: TextStyle(fontSize: 16.0)),
        leading: Icon(Icons.document_scanner_outlined),
      ),
    );
  }

  /* Widget llamar() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Center(
        child: Column(
          children: [
              Row(
                children: [
                  Text(""),
                ],
              ),


          ],
        ),
      )
    );
  } */
  Widget llamar(valor, nombre) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(8),
            title: Text(
              valor,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            leading: Icon(Icons.phone),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
                label: Text(
                  "Llamar",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.phone_callback_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  _hacerLlamada(valor);
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                label: Text(
                  "Contactar",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.whatsapp,
                  color: Colors.white,
                ),
                onPressed: () {
                  _escribirWhatsapp(valor, nombre);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _hacerLlamada(String number) async {
    final Uri launchUri = Uri(scheme: 'tel', path: number);
    await launchUrl(launchUri);
  }

  Future<void> _escribirWhatsapp(String number, String name) async { 
    final String numero = number;
    final String nombre = name;

    final Uri _url = Uri.parse(
        "whatsapp://send?phone=$number&text=Buenos dias recicladora $nombre");

    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }*/