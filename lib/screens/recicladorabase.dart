import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/model/recicladora_model.dart';
import 'package:material_kit_flutter/services/recicladora_services.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';

class RecicladoraBasePage extends StatefulWidget {
  const RecicladoraBasePage({Key key}) : super(key: key);

  @override
  State<RecicladoraBasePage> createState() => _RecicladoraBasePageState();
}

class _RecicladoraBasePageState extends State<RecicladoraBasePage> {
  String comboCiudad;
  List _itemCiudades = ["El Alto", "La Paz"];
  String _comboZona;
  List itemZonas = ["Todas", "Obrajes", "Vino tinto", "Bolognia"];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Recicladoras de Base",
        searchBar: false,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // key: _scaffoldKey,
      drawer: MaterialDrawer(currentPage: "Recicladoras"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image(
                  image: AssetImage('assets/img/recicladorabtn.png'),
                  height: 130,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Recicladoras de Base',
                        style: TextStyle(
                            fontSize: 27.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 117, 117, 117))),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                        width: 280,
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 0, 0, 0), width: 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Buscar",
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              hintStyle: TextStyle(fontSize: 16.0)),
                        )),
                  )
                ],
              ),
              /* Expanded(
                child: recicler(),
              ),  */
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 280,
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: MaterialColors.mysecondary, width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        icon: Icon(Icons.arrow_drop_down,
                            color: MaterialColors.mysecondary),
                        isExpanded: true,
                        hint: Text('Elegir ciudad'),
                        value: comboCiudad,
                        onChanged: (newValue) {
                          setState(() {
                            comboCiudad = newValue;
                            searchController.clear();
                          });
                        },
                        items: _itemCiudades.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 280,
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: MaterialColors.mysecondary, width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: MaterialColors.mysecondary,
                        ),
                        isExpanded: true,
                        hint: Text('Elegir zona'),
                        value: _comboZona,
                        onChanged: (newValue) {
                          setState(() {
                            _comboZona = newValue;
                          });
                        },
                        items: itemZonas.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              SizedBox(
                height: 200.0,
                child: Rows(
                    text: searchController.text,
                    zona: _comboZona,
                    ciudad: comboCiudad),
              ),
              SizedBox(height: 60.0),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
        backgroundColor: MaterialColors.myprimary,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }
}

class Rows extends StatelessWidget {
  final _recicladoraService = RecicladoraServices();

  final String text;
  final String zona;
  final String ciudad;

  Rows({Key key, this.text, this.zona, this.ciudad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _recicladoraService.getRecicladora(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          List<Recicladora> recicladoras = snapshot.data;
          if (recicladoras == null || recicladoras.isEmpty) {
            return Text('No hay recicladoras');
          }
          /* if (recicladoras.isNotEmpty) {
            return Text('No hay recicladoras');
          } */
          if (text.isEmpty &&
              (ciudad?.isEmpty ?? true || zona?.isEmpty ?? true)) {
            return Text('Busque por favor');
          }

          if (text.isNotEmpty) {
            var t = text.toLowerCase();
            recicladoras = recicladoras
                .where((r) =>
                    r.nombre.toLowerCase().contains(t) ||
                    r.zona.toLowerCase().contains(t))
                .toList();
          } else if (text.isEmpty && ciudad.isNotEmpty) {
            var z = zona?.toLowerCase() ?? 'OtherStringJustInCase';
            var c = ciudad.toLowerCase();
            if (zona == "Todas") {
              recicladoras = recicladoras
                .where((r) =>
                    r.departamento.toLowerCase().contains(c))
                .toList();
            } else {
              recicladoras = recicladoras
                  .where((r) =>
                      r.departamento.toLowerCase().contains(c) &&
                      r.zona.toLowerCase().contains(z))
                  .toList();
            }
          }

          /* if (ciudad?.isNotEmpty ?? true  || zona?.isNotEmpty ?? true) {
            
          } */

          return Expanded(
            child: Card(
              color: Color.fromARGB(255, 215, 213, 213),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 20.0,
              child: ListView.builder(
                itemCount: recicladoras.length,
                itemBuilder: (context, index) {
                  var r = recicladoras[index];
                  print(r);
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(0, 255, 255, 255)
                    ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/details', arguments: r);
                      },
                      child: Card(
                        color: MaterialColors.mysecondary,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: CircleAvatar(
                                    child: Image(
                                  image: AssetImage(
                                      'assets/img/recicladorabtn.png'),
                                )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,                              

                                children: [
                                  Text(r.nombre,
                                    style: TextStyle(
                                      fontSize:18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                    ),
                                  ), 
                                  Row(
                                    children: [
                                      Text(r.departamento + " - ",
                                      ),
                                      Text(r.zona)
                                    ],
                                  ), 
                                ],
                              ),
                              /* Padding(padding: EdgeInsets.only(left: 100.0, right: 10.0, top: 10.0, bottom: 10.0),
                              child: Icon(Icons.navigate_next_sharp, color: Colors.white,),) */
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          );
        });
  }
}
/* 
Widget recicler() {
  return FutureBuilder(
    future: RecicladoraServices().getRecicler(),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      List misrecicladoras = snapshot.data ?? [];
      return ListView(
        children: [
          for(Recicladora recicladora in misrecicladoras)
            ListTile(
              title: Text(recicladora.nombre),
              subtitle: Text(recicladora.zona),
            ),
        ],
      );
    },
  );
}  */

 /* Widget Rows() {
    return StreamBuilder(
      stream: FirebaseDatabase.instance.ref().child('ecoemprendimientos').onValue,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return ListView.builder(
          itemBuilder: (context, int index) {
            return ListTile(
              title: Text(snapshot.data.snapshot.value['nombre'].toString()),
            );
          },
        );
      },
    );
  } */

 