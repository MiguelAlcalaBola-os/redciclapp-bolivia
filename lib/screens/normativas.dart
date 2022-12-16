import 'package:flutter/material.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/Theme.dart';

class NormativasRedciclaPage extends StatefulWidget {
  const NormativasRedciclaPage({Key key}) : super(key: key);

  @override
  State<NormativasRedciclaPage> createState() => _NormativasRedciclaPageState();
}

class _NormativasRedciclaPageState extends State<NormativasRedciclaPage> {
  final Uri _launchUrl1 =
      Uri.parse("https://drive.google.com/file/d/1VDkzMxTpIfwIw13TlHu5Zab5LORjTI8D/view");
  final Uri _launchUrl2 =
      Uri.parse("https://drive.google.com/file/d/16GcVautAT_syeyWHSVo0Xeezzl_sugtr/view");
  final Uri _launchUrl3 =
      Uri.parse("https://drive.google.com/file/d/1PJF9BgEfo0vsP-2vlRsN6juff3AMGPeC/view");
  final Uri _launchUrl4 =
      Uri.parse("https://drive.google.com/file/d/1_x_LLhN7mcdSXu75zKBMczPSCyR9rvTs/view");
  final Uri _launchUrl5 =
      Uri.parse("https://drive.google.com/file/d/1b-HHhd9VT2uQjJJaIEXdlIQIROA_ellh/view");
  final Uri _launchUrl6 =
      Uri.parse("https://drive.google.com/file/d/1fTn9PyPim17cEc0xApZsWjJyXQQ3eb5w/view");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(title: "Normativas"),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Normativas"),
        body: Container(
          
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Image(
                    image: AssetImage('assets/img/iniciobanner.jpg'),
                    height: 100,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: _launchUrl1Exec,
                              child: Card(
                                color: Color.fromARGB(255, 239, 238, 238),
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 130.0,
                                      height: 120.0,
                                      child: Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/img/pdf.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Ley del Medio Ambiente Nro 1333',
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            GestureDetector(
                              onTap: _launchUrl2Exec,
                              child: Card(
                                color: Color.fromARGB(255, 239, 238, 238),
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 130.0,
                                      height: 120.0,
                                      child: Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/img/pdf.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Ley de Gestión de Residuos Nro 755',
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: _launchUrl3Exec,
                              child: Card(
                                color: Color.fromARGB(255, 239, 238, 238),
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 130.0,
                                      height: 120.0,
                                      child: Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/img/pdf.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Ley marco de madre tierra y desarrollo integral',
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            GestureDetector(
                              onTap: _launchUrl4Exec,
                              child: Card(
                                color: Color.fromARGB(255, 239, 238, 238),
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 130.0,
                                      height: 120.0,
                                      child: Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/img/pdf.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Reglamento de Ley Nro 1333',
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: _launchUrl5Exec,
                              child: Card(
                                color: Color.fromARGB(255, 239, 238, 238),
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 130.0,
                                      height: 120.0,
                                      child: Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/img/pdf.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Decreto Supremo Nro 2954',
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            GestureDetector(
                              onTap: _launchUrl6Exec,
                              child: Card(
                                color: Color.fromARGB(255, 239, 238, 238),
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 130.0,
                                      height: 120.0,
                                      child: Column(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/img/pdf.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Reglamento de Ley Nro 755',
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_ios_outlined ,color: Colors.white,),
          backgroundColor: MaterialColors.myprimary,
          onPressed: () {
              Navigator.pushReplacementNamed(context, '/acercade');
            },
          ),);
  }

  Future<void> _launchUrl1Exec() async {
    if (!await launchUrl(
      _launchUrl1,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $_launchUrl1';
    }
  }
  Future<void> _launchUrl2Exec() async {
    if (!await launchUrl(
      _launchUrl2,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $_launchUrl2';
    }
  }
  Future<void> _launchUrl3Exec() async {
    if (!await launchUrl(
      _launchUrl3,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $_launchUrl3';
    }
  }
  Future<void> _launchUrl4Exec() async {
    if (!await launchUrl(
      _launchUrl4,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $_launchUrl4';
    }
  }
  Future<void> _launchUrl5Exec() async {
    if (!await launchUrl(
      _launchUrl5,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $_launchUrl5';
    }
  }
  Future<void> _launchUrl6Exec() async {
    if (!await launchUrl(
      _launchUrl6,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $_launchUrl6';
    }
  }


}
