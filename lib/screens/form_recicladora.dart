import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/services/crud_services.dart';
import 'package:material_kit_flutter/services/recicladora_services.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:intl/intl.dart';

class RegisterRecicladora extends StatefulWidget {
  //RegisterRecicladora({Key key}) : super(key: key);

  @override
  State<RegisterRecicladora> createState() => _RegisterRecicladoraState();
}

class _RegisterRecicladoraState extends State<RegisterRecicladora> {
  final TextEditingController _nombreCompletoController =
      TextEditingController();
  final TextEditingController _numeroCelularController =
      TextEditingController();
  final TextEditingController _queResiduosController = TextEditingController();
  final TextEditingController _callesRecorreController =
      TextEditingController();
  final TextEditingController _horariosRecolectaController =
      TextEditingController();
  final TextEditingController _queDiasRecorreController =
      TextEditingController();
  final TextEditingController _detallesController = TextEditingController();

  final GlobalKey<FormState> _formRecicladora = GlobalKey<FormState>();

  String comboCiudad;
  List _itemCiudades = ["El Alto", "La Paz"];
  String _comboZona;
  List _itemZonas = ["Zonas", "Obrajes", "Vino tinto", "Bolognia"];

  String hoy = DateTime.now().toString();

  // DatabaseReference dbRef;

  // @override
  // void initState() {
  //   super.initState();
  //   dbRef = FirebaseDatabase.instance.ref().child('Reciclador');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Añadir Reciclador/a',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(20, 91, 59, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/options');
            },
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // key: _scaffoldKey,
        body: StreamBuilder<User>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              var email = snapshot.data.email;
              return formularioRecicladora(email);
            } else {
              return LoginScreen();
            }
          },
        ));
  }

  Widget formularioRecicladora(String email) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formRecicladora,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _nombreCompleto(),
              SizedBox(
                height: 15.0,
              ),
              _elegirCiudad(),
              SizedBox(
                height: 15.0,
              ),
              _elegirZona(),
              SizedBox(
                height: 10.0,
              ),
              _numCelular(),
              SizedBox(
                height: 10.0,
              ),
              _queResiduos(),
              SizedBox(
                height: 10.0,
              ),
              _callesRecorre(),
              SizedBox(
                height: 10.0,
              ),
              _queHorarios(),
              SizedBox(
                height: 10.0,
              ),
              _queDias(),
              SizedBox(
                height: 10.0,
              ),
              _queDetalles(),
              SizedBox(
                height: 25.0,
              ),
              _registerButton(email),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nombreCompleto() {
    return TextFormField(
        controller: _nombreCompletoController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.account_circle,
            color: MaterialColors.mysecondary,
          ),
          helperText: 'Nombre completo',
          labelText: 'Nombre del reciclador/a',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorNombreCompleto(value)));
  }

  Widget _elegirCiudad() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 28.0),
          margin: EdgeInsets.only(left: 13.0, right: 0),
          child: DropdownButtonFormField(
            isExpanded: true,
            hint: Text(
              'Elegir ciudad',
              style: TextStyle(color: MaterialColors.mysecondary),
            ),
            items: _itemCiudades.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
            value: comboCiudad,
            onChanged: (value) {
              setState(() {
                comboCiudad = value;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 13.0,
          ),
          //margin: EdgeInsets.only(top: 80.0, left: 28.0),
          child: Icon(
            Icons.place,
            color: MaterialColors.mysecondary,
            size: 25.0,
          ),
        ),
      ],
    );
  }

  Widget _elegirZona() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 28.0),
          margin: EdgeInsets.only(left: 13.0, right: 0),
          child: DropdownButton(
            isExpanded: true,
            hint: Text(
              'Elegir zona',
              style: TextStyle(color: MaterialColors.mysecondary),
            ),
            items: _itemZonas.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
            value: _comboZona,
            onChanged: (value) {
              setState(() {
                _comboZona = value;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 13.0,
          ),
          //margin: EdgeInsets.only(top: 80.0, left: 28.0),
          child: Icon(
            Icons.location_city,
            color: MaterialColors.mysecondary,
            size: 25.0,
          ),
        ),
      ],
    );
  }

  Widget _numCelular() {
    return TextFormField(
        keyboardType: TextInputType.number,
        controller: _numeroCelularController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.phone_android,
            color: MaterialColors.mysecondary,
          ),
          helperText: 'Solo numeros, sin agregar +591',
          labelText: 'Nro. de celular',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorNumCelular(value)));
  }

  Widget _queResiduos() {
    return TextFormField(
        controller: _queResiduosController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.article,
            color: MaterialColors.mysecondary,
          ),
          helperText: 'Los 3 residuos principales que recolecta',
          labelText: 'Que residuos recolecta?',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorNombreCompleto(value)));
  }

  Widget _callesRecorre() {
    return TextFormField(
        controller: _callesRecorreController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.place,
            color: MaterialColors.mysecondary,
          ),
          helperText: 'Las 2 calles principales que recorre',
          labelText: 'Calles que recorre',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorNombreCompleto(value)));
  }

  Widget _queHorarios() {
    return TextFormField(
        controller: _horariosRecolectaController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.timer_outlined,
            color: MaterialColors.mysecondary,
          ),
          helperText: 'De que hora a que hora?',
          labelText: 'En que horarios recolecta?',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorNombreCompleto(value)));
  }

  Widget _queDias() {
    return TextFormField(
        controller: _queDiasRecorreController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.calendar_today,
            color: MaterialColors.mysecondary,
          ),
          //helperText: '',
          labelText: 'Que dias de la semana recorre su ruta?',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorNombreCompleto(value)));
  }

  Widget _queDetalles() {
    return TextFormField(
        controller: _detallesController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.message,
            color: MaterialColors.mysecondary,
          ),
          helperText:
              'Cualquier detalle que considere relevante sobre esta recicladora',
          labelText: 'Detalles adicionales',
          labelStyle: TextStyle(color: MaterialColors.mysecondary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.mysecondary)),
        ),
        validator: ((value) => _validatorNombreCompleto(value)));
  }

  Widget _registerButton(String email) {
    var _em = email;
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
            if (_formRecicladora.currentState.validate()) {
              bool resp = await CRUDServices().guardarData({
                'nombre': _nombreCompletoController.text,
                'departamento': comboCiudad,
                'zona': _comboZona,
                'fecha': hoy,
                'celular': _numeroCelularController.text,
                'horarios': _horariosRecolectaController.text,
                'recolecta': _queResiduosController.text,
                'ruta': _callesRecorreController.text,
                'dias': _queDiasRecorreController.text,
                'correo': _em,
                'detalles': _detallesController.text
              }, 'recicladoras');

              if (resp) {
                Navigator.pushReplacementNamed(context, '/options');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Recicladora registrada'),
                  backgroundColor: Colors.green,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Algo salio mal'),
                  backgroundColor: Colors.red,
                ));
              }
              // Map<String, String> reciclador = {
              //       'nombre': _nombreCompletoController.text,
              //       'departamento': comboCiudad,
              //       'zona': _comboZona,
              //       'fecha': hoy,
              //       'celular': _numeroCelularController.text,
              //       'horarios': _horariosRecolectaController.text,
              //       'recolecta': _queResiduosController.text,
              //       'ruta': _callesRecorreController.text,
              //       'dias': _queDiasRecorreController.text,
              //       'correo': email,
              //       'detalle':_detallesController.text
              //     };

              //     dbRef.push().set(reciclador);
            }
          },
          child: Text('Guardar', style: TextStyle(color: Colors.white))),
    );
  }

  String _validatorNombreCompleto(String value) {
    if (!_minLength(value)) {
      return 'Por favor llene este campo';
    }
  }

  String _validatorNumCelular(String value) {
    if (!_minLengthCelular(value)) {
      return 'Por favor ingresa solo 8 digitos de celular';
    }
  }

  bool _minLength(String value) {
    return value.isNotEmpty && value.length >= 4;
  }

  bool _minLengthCelular(String value) {
    return value.isNotEmpty && value.length == 8;
  }
}
