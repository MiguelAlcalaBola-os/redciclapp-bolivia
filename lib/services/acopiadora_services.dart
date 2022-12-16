import 'package:firebase_database/firebase_database.dart';

class AcopiadoraServices {
  Future<bool> guardarAcopiadora(
      String nombreCompleto,
      String comboCiudad,
      String comboZona,
      String hoy,
      String celular,
      String horarios,
      String residuos,
      String direccion,
      String detalle,
      String em) async {
    try {
      await FirebaseDatabase.instance.ref().child('acopiadores').push().set({
        'nombre': nombreCompleto,
        'ciudad': comboCiudad,
        'zona': comboZona,
        'fecha': hoy,
        'celular': celular,
        'horarios': horarios,
        'querecibe': residuos,
        'direccion': direccion,
        'detalles':detalle,
        'correo': em
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
