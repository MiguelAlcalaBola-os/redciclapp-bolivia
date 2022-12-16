import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

//widgets
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:material_kit_flutter/widgets/card-small.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import "./form_recicladora.dart";
import "./form_ecoemprendimiento.dart";
import "./form_acopiadora.dart";

final Map<String, Map<String, String>> homeCards = {
  "Makeup": {
    "title": "Recicladoras de Base",
    "image": "assets/img/Recicladoras de base.png",
    "price": "220"
  },
  "Coffee": {
    "title": "Puntos de Acopio",
    "image": "assets/img/Puntos de Acopio.png",
    "price": "40"
  },
  "eco": {
    "title": "Eco emprendimientos",
    "image": "assets/img/ecoemprendimiento.png",
    "price": "220"
  },
  "acerca": {
    "title": "Acerca de Redcicla",
    "image": "assets/img/acercabtn.png",
    "price": "40"
  }
};

class Home extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.lightGreenAccent,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                child: Icon(Icons.add_task_outlined),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterRecicladora()),
                    ),
                label: "añadir recicladora",
                backgroundColor: Colors.lightGreen),
            SpeedDialChild(
                child: Icon(Icons.person_add_outlined),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterEcoemprendimiento()),),
                label: "añadir ecoemprendimiento",
                backgroundColor: Colors.lightGreen),
            SpeedDialChild(
                child: Icon(Icons.add),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterAcopiadora()),),
                label: "añadir acopiadora",
                backgroundColor: Colors.lightGreen)
          ],
        ),
        appBar: Navbar(
          title: "Inicio",
          searchBar: true,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Home"),
        body: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image(
                    image: AssetImage('assets/img/iniciobanner.jpg'),
                  ),
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSmall(
                        cta: "View article",
                        title: homeCards["Makeup"]['title'],
                        img: homeCards["Makeup"]['image'],
                        tap: () {
                          Navigator.pushReplacementNamed(
                              context, '/recicladora');
                        }),
                    CardSmall(
                        cta: "View article",
                        title: homeCards["Coffee"]['title'],
                        img: homeCards["Coffee"]['image'],
                        tap: () {
                          Navigator.pushReplacementNamed(context, '/acopios');
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardSmall(
                        cta: "View article",
                        title: homeCards["eco"]['title'],
                        img: homeCards["eco"]['image'],
                        tap: () {
                          Navigator.pushReplacementNamed(context, '/ecoempren');
                        }),
                    CardSmall(
                        cta: "View article",
                        title: homeCards["acerca"]['title'],
                        img: homeCards["acerca"]['image'],
                        tap: () {
                          Navigator.pushReplacementNamed(context, '/acercade');
                        })
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
