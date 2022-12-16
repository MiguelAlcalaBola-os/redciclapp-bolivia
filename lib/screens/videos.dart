import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/screens/components.dart';
import 'package:material_kit_flutter/widgets/card-small.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class VideosRedciclaPage extends StatefulWidget {
  const VideosRedciclaPage({Key key}) : super(key: key);

  @override
  State<VideosRedciclaPage> createState() => _VideosRedciclaPageState();
}

class _VideosRedciclaPageState extends State<VideosRedciclaPage> {
  final Uri _launchUrl1 =
      Uri.parse("https://youtu.be/UEXPXCfENqk");
  final Uri _launchUrl2 =
      Uri.parse("https://youtu.be/NeGpHeleOd0");
  final Uri _launchUrl3 =
      Uri.parse("https://youtu.be/nH1tF9HwJ4o");
  final Uri _launchUrl4 =
      Uri.parse("https://youtu.be/2N_aG0O-Fs0");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(title: "Videos"),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Normativas"),
        body: Container(
          
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Image(
                            image: AssetImage('assets/img/ciclo.jpg'),
                            height: 210,
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
                        width: 300.0,
                        child: Text('Mira algunos videos sobre los actores del ciclo del reciclaje:',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 117, 117, 117))),
                      ),
                    )
                  ],
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
                                                'assets/img/youtubeplay.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Familias que separan',
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
                                                'assets/img/youtubeplay.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Familias que separan',
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
                                                'assets/img/youtubeplay.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Recicladoras de base',
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
                                                'assets/img/youtubeplay.png'),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          Text(
                                            'Eco-emprendimientos',
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
          ),
        );
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

}
