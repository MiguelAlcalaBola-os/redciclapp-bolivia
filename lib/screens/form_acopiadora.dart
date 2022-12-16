import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/screens/login_page.dart';
import 'package:material_kit_flutter/services/crud_services.dart';
import "../main.dart";
import '../services/acopiadora_services.dart';

class RegisterAcopiadora extends StatefulWidget {
  //RegisterRecicladora({Key key}) : super(key: key);

  @override
  State<RegisterAcopiadora> createState() => _RegisterAcopiadoraState();
}

class _RegisterAcopiadoraState extends State<RegisterAcopiadora> {
  
  final TextEditingController _nombreCompletoController =
      TextEditingController();
  final TextEditingController _numeroCelularController =
      TextEditingController();
  final TextEditingController _queResiduosController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _horarioAtencionController =
      TextEditingController();
  final TextEditingController _queDiasRecorreController =
      TextEditingController();
  final TextEditingController _detallesController = TextEditingController();

  final GlobalKey<FormState> _formAcopiadora = GlobalKey<FormState>();

  String comboCiudad;
  List _itemCiudades = ["El Alto", "La Paz"];
  String _comboZona;
  List _itemZonas = ["Zonas", "Obrajes", "Vino tinto", "Bolognia"];

  String hoy = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Añadir Punto de Acopio',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: MaterialColors.myprimary,
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
              return formularioAcopiadora(email);
            } else {
              return LoginScreen();
            }
          },
        ));
  }

  Widget formularioAcopiadora(String email) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formAcopiadora,
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
              _direccion(),
              SizedBox(
                height: 10.0,
              ),
              _queHorarios(),
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
          helperText: 'Los 3 residuos principales que acopia',
          labelText: 'Que residuos recibe?',
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

  Widget _direccion() {
    return TextFormField(
        controller: _direccionController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.place,
            color: MaterialColors.mysecondary,
          ),
          //helperText: 'Las 2 calles principales que recorre',
          labelText: 'Escribe la direccion',
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
        controller: _horarioAtencionController,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.timer_outlined,
            color: MaterialColors.mysecondary,
          ),
          //helperText: 'De que hora a que hora?',
          labelText: 'Horarios de atención',
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
          helperText: 'Cualquier detalle que quieras agregar',
          labelText: 'Detalles o comentarios',
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
            if (_formAcopiadora.currentState.validate()) {
              bool resp = await CRUDServices().guardarData({
                //AcopiadoraServices().guardarAcopiadora(
                'nombre': _nombreCompletoController.text,
                'ciudad': comboCiudad,
                'zona': _comboZona,
                'fecha': hoy,
                'celular': _numeroCelularController.text,
                'horarios': _horarioAtencionController.text,
                'querecibe': _queResiduosController.text,
                'direccion': _direccionController.text,
                'detalles': _detallesController.text,
                'correo': _em
              },"acopiadores/${_uidUser.hashCode}");
              if (resp) {
                Navigator.pushReplacementNamed(context, '/options');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Punto de Acopio registrado'),
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

  StreamBuilder<User> _uidUser(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {

          if (snapshot.hasData) {
           
            var name = snapshot.data.uid;
             print(name);
            return Text(name, style: TextStyle(
              color: Colors.white
            ),);
          } else {
            return Text('sin nomvew');
          }
        });
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
