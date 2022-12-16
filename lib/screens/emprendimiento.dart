import 'package:flutter/material.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';

class EcoEmprendimientoPage extends StatefulWidget {
  const EcoEmprendimientoPage({Key key}) : super(key: key);

  @override
  State<EcoEmprendimientoPage> createState() => _EcoEmprendimientoPageState();
}

class _EcoEmprendimientoPageState extends State<EcoEmprendimientoPage> {
  String comboCiudad;
  List itemCiudades = ["El Alto", "La Paz"];
  String comboZona;
  List itemZonas = ["Zonas", "Obrajes", "Vino tinto", "Bolognia"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Eco-emprendimientos",
          searchBar: false,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Eco-emprendimientos"),
        body: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image(
                    image: AssetImage('assets/img/ecoemprendimientobtn.png'),
                    height: 130,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Eco-emprendimientos',
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
                          border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Buscar",
                            suffixIcon: Icon(Icons.search, color: Colors.black,),
                            hintStyle: TextStyle(fontSize: 16.0)
                          ),
                        )
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
                          border: Border.all(color: MaterialColors.mysecondary, width: 1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: DropdownButton(
                          underline: SizedBox(),
                          icon: Icon(Icons.arrow_drop_down, color: MaterialColors.mysecondary,),
                          isExpanded: true,
                          hint: Text('Elegir ciudad'),
                          value: comboCiudad,
                          onChanged: (newValue) {
                            setState(() {
                              comboCiudad = newValue;
                            });
                          },
                          items: itemCiudades.map((valueItem) {
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
                            border: Border.all(color: MaterialColors.mysecondary, width: 1),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: DropdownButton(
                            underline: SizedBox(),
                            icon: Icon(Icons.arrow_drop_down, color: MaterialColors.mysecondary,),
                            isExpanded: true,
                            hint: Text('Todas'),
                            value: comboZona,
                            onChanged: (newValue) {
                              setState(() {
                                comboZona = newValue;
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

                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 110, 201, 102),
                            minimumSize: const Size(280.0, 45.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        child: Row(
                          children:[
                            Icon(
                              Icons.app_registration ,color: Colors.white,
                            ),
                            SizedBox(width: 20.0),
                            const Text('Registrarse',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.white),
                            ),
                          ],
                        ),
                          onPressed: (){},
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.0), */


              
              ],
            ),
          ),
        ),
        

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home,color: Colors.white,),
          backgroundColor: MaterialColors.myprimary,
          onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        );
  }
}
