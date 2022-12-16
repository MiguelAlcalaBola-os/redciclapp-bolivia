import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:material_kit_flutter/dashboard/update_video.dart';
import 'package:material_kit_flutter/services/crud_services.dart';
// import 'package:material_kit_flutter/screens/components.dart';
// import 'package:material_kit_flutter/widgets/card-small.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';
import "formvideos.dart";
import "getstarted.dart";

class VideosAdmin extends StatefulWidget {
  const VideosAdmin({Key key}) : super(key: key);

  @override
  State<VideosAdmin> createState() => _VideosAdmin();
}

class _VideosAdmin extends State<VideosAdmin> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Video');
  // List<String> URL = [
  //   "https://youtu.be/UEXPXCfENqk",
  //   "https://youtu.be/NeGpHeleOd0",
  //   "https://youtu.be/nH1tF9HwJ4o",
  //   "https://youtu.be/2N_aG0O-Fs0"
  // ];
  //final Uri _launchUrl1 = Uri.parse("https://youtu.be/UEXPXCfENqk");
  // final Uri _launchUrl2 = Uri.parse("https://youtu.be/NeGpHeleOd0");
  // final Uri _launchUrl3 = Uri.parse("https://youtu.be/nH1tF9HwJ4o");
  // final Uri _launchUrl4 = Uri.parse("https://youtu.be/2N_aG0O-Fs0");

  Widget listItem({Map video}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Color.fromARGB(255, 219, 219, 219),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  loadLink(video['enlace']);
                },
                child: Image(
                  image: AssetImage('assets/img/youtubeplay.png'),
                  width: 50.0,
                  height: 50.0,
                ),
              ),

              Text(
                video['nombre'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              // Text(
              //   pdf['enlace'],
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => UpdateVideo(videoKey: video['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () async {
                  final resp =
                      await CRUDServices().deleteData('Video', video['key']);
                  if (resp) {
                    print('Eliminado');
                  } else {
                    print('Ocurrio un error');
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SpeedDial(
            backgroundColor: Colors.lightGreenAccent,
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.add),
                  onTap: (() => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormVideo()))),
                  label: "Añadir Video",
                  backgroundColor: Colors.lightGreen),
              SpeedDialChild(
                  child: Icon(Icons.delete),
                  onTap: () {},
                  label: "Eliminar Video",
                  backgroundColor: Colors.lightGreen),
              SpeedDialChild(
                  child: Icon(Icons.update),
                  onTap: () {},
                  label: "Renovar Video",
                  backgroundColor: Colors.lightGreen)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(
              Icons.arrow_back_sharp,
              color: Color.fromARGB(255, 38, 201, 16),
            ),
            backgroundColor: MaterialColors.myprimary,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetStarted()));
            },
          ),
        ],
      ),
      appBar: Navbar(title: "Videos"),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // key: _scaffoldKey,
      drawer: MaterialDrawer(currentPage: "Normativas"),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map video = snapshot.value as Map;
            video['key'] = snapshot.key;

            return listItem(video: video);
          },
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: Navbar(title: "Videos"),
  //       backgroundColor: Color.fromARGB(255, 255, 255, 255),
  //       // key: _scaffoldKey,
  //       drawer: MaterialDrawer(currentPage: "Normativas"),
  //       body: Container(
  //         padding: EdgeInsets.only(left: 10.0, right: 10.0),
  //         child: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               SizedBox(height: 20.0),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [],
  //               ),
  //               SizedBox(height: 20.0),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Center(
  //                       child: Column(
  //                     children: [
  //                       SizedBox(height: 20.0),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           GestureDetector(
  //                             onTap: _launchUrl1Exec,
  //                             child: Card(
  //                               color: Color.fromARGB(255, 239, 238, 238),
  //                               elevation: 8.0,
  //                               shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(14.0)),
  //                               child: Column(
  //                                 children: <Widget>[
  //                                   Container(
  //                                     padding: EdgeInsets.all(10.0),
  //                                     width: 130.0,
  //                                     height: 120.0,
  //                                     child: Column(
  //                                       children: [
  //                                         Image(
  //                                           image: AssetImage(
  //                                               'assets/img/youtubeplay.png'),
  //                                           width: 50.0,
  //                                           height: 50.0,
  //                                         ),
  //                                         Text(
  //                                           'video 1',
  //                                           style: TextStyle(
  //                                               fontSize: 13.0,
  //                                               fontWeight: FontWeight.w400),
  //                                           textAlign: TextAlign.center,
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Row(children: [
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.edit)),
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.delete))
  //                                   ])
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 40.0,
  //                           ),
  //                           GestureDetector(
  //                             child: Card(
  //                               color: Color.fromARGB(255, 239, 238, 238),
  //                               elevation: 8.0,
  //                               shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(14.0)),
  //                               child: Column(
  //                                 children: <Widget>[
  //                                   Container(
  //                                     padding: EdgeInsets.all(10.0),
  //                                     width: 130.0,
  //                                     height: 120.0,
  //                                     child: Column(
  //                                       children: [
  //                                         Image(
  //                                           image: AssetImage(
  //                                               'assets/img/youtubeplay.png'),
  //                                           width: 50.0,
  //                                           height: 50.0,
  //                                         ),
  //                                         Text(
  //                                           'video 2',
  //                                           style: TextStyle(
  //                                               fontSize: 13.0,
  //                                               fontWeight: FontWeight.w400),
  //                                           textAlign: TextAlign.center,
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Row(children: [
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.edit)),
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.delete))
  //                                   ])
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(height: 20.0),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           GestureDetector(
  //                             child: Card(
  //                               color: Color.fromARGB(255, 239, 238, 238),
  //                               elevation: 8.0,
  //                               shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(14.0)),
  //                               child: Column(
  //                                 children: <Widget>[
  //                                   Container(
  //                                     padding: EdgeInsets.all(10.0),
  //                                     width: 130.0,
  //                                     height: 120.0,
  //                                     child: Column(
  //                                       children: [
  //                                         Image(
  //                                           image: AssetImage(
  //                                               'assets/img/youtubeplay.png'),
  //                                           width: 50.0,
  //                                           height: 50.0,
  //                                         ),
  //                                         Text(
  //                                           'video 3',
  //                                           style: TextStyle(
  //                                               fontSize: 13.0,
  //                                               fontWeight: FontWeight.w400),
  //                                           textAlign: TextAlign.center,
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Row(children: [
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.edit)),
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.delete))
  //                                   ])
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 40.0,
  //                           ),
  //                           GestureDetector(
  //                             child: Card(
  //                               color: Color.fromARGB(255, 239, 238, 238),
  //                               elevation: 8.0,
  //                               shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(14.0)),
  //                               child: Column(
  //                                 children: <Widget>[
  //                                   Container(
  //                                     padding: EdgeInsets.all(10.0),
  //                                     width: 130.0,
  //                                     height: 120.0,
  //                                     child: Column(
  //                                       children: [
  //                                         Image(
  //                                           image: AssetImage(
  //                                               'assets/img/youtubeplay.png'),
  //                                           width: 50.0,
  //                                           height: 50.0,
  //                                         ),
  //                                         Text(
  //                                           'video 4',
  //                                           style: TextStyle(
  //                                               fontSize: 13.0,
  //                                               fontWeight: FontWeight.w400),
  //                                           textAlign: TextAlign.center,
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Row(children: [
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.edit)),
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.delete))
  //                                   ])
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           GestureDetector(
  //                             onTap: _launchUrl1Exec,
  //                             child: Card(
  //                               color: Color.fromARGB(255, 239, 238, 238),
  //                               elevation: 8.0,
  //                               shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(14.0)),
  //                               child: Column(
  //                                 children: <Widget>[
  //                                   Container(
  //                                     padding: EdgeInsets.all(10.0),
  //                                     width: 130.0,
  //                                     height: 120.0,
  //                                     child: Column(
  //                                       children: [
  //                                         Image(
  //                                           image: AssetImage(
  //                                               'assets/img/youtubeplay.png'),
  //                                           width: 50.0,
  //                                           height: 50.0,
  //                                         ),
  //                                         Text(
  //                                           'video 5',
  //                                           style: TextStyle(
  //                                               fontSize: 13.0,
  //                                               fontWeight: FontWeight.w400),
  //                                           textAlign: TextAlign.center,
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Row(children: [
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.edit)),
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.delete))
  //                                   ])
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 40.0,
  //                           ),
  //                           GestureDetector(
  //                             child: Card(
  //                               color: Color.fromARGB(255, 239, 238, 238),
  //                               elevation: 8.0,
  //                               shape: RoundedRectangleBorder(
  //                                   borderRadius: BorderRadius.circular(14.0)),
  //                               child: Column(
  //                                 children: <Widget>[
  //                                   Container(
  //                                     padding: EdgeInsets.all(10.0),
  //                                     width: 130.0,
  //                                     height: 120.0,
  //                                     child: Column(
  //                                       children: [
  //                                         Image(
  //                                           image: AssetImage(
  //                                               'assets/img/youtubeplay.png'),
  //                                           width: 50.0,
  //                                           height: 50.0,
  //                                         ),
  //                                         Text(
  //                                           'video 6',
  //                                           style: TextStyle(
  //                                               fontSize: 13.0,
  //                                               fontWeight: FontWeight.w400),
  //                                           textAlign: TextAlign.center,
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Row(children: [
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.edit)),
  //                                     IconButton(
  //                                         onPressed: () {},
  //                                         icon: Icon(Icons.delete))
  //                                   ])
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(height: 20.0),
  //                     ],
  //                   ))
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       floatingActionButton: Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           FloatingActionButton(
  //             child: Icon(
  //               Icons.add,
  //               color: Color.fromARGB(255, 38, 201, 16),
  //             ),
  //             backgroundColor: MaterialColors.myprimary,
  //             onPressed: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => FormVideo()));
  //             },
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           FloatingActionButton(
  //             child: Icon(
  //               Icons.arrow_back_sharp,
  //               color: Color.fromARGB(255, 38, 201, 16),
  //             ),
  //             backgroundColor: MaterialColors.myprimary,
  //             onPressed: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => GetStarted()));
  //             },
  //           ),
  //         ],
  //       ));
  // }

  Future<void> loadLink(enlace) async {
    if (!await launchUrl(
      Uri.parse(enlace),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'No se pudo cargar en enlace: $enlace';
    }
  }

  // Future<void> _launchUrl1Exec() async {
  //   if (!await launchUrl(
  //     _launchUrl1,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw 'Could not launch $_launchUrl1';
  //   }
  // }
}
