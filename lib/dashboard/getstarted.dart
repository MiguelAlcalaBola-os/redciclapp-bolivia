import '../dashboard_styles/color.dart';
import '../dashboard_styles/typo.dart';
import 'package:flutter/material.dart';
import 'pdfs_admin.dart';
import 'users_admin.dart';
import 'videos_admin.dart';
import "../screens/login_page.dart";

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())),
          child: Icon(Icons.arrow_back)),
      backgroundColor: softPurple,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset('assets/img/REDcicla.png', height: 230),
            SizedBox(
              height: 10,
            ),
            Text(
              'Perfil del admin',
              style: header,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Aqui estan todos los campos que necesitas manejar y editar con la mejor tecnologia',
              style: paragraph,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: double.infinity,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PDFs()))),
                                child: Image.asset('assets/img/pdf.png',
                                    height: 50),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'PDFs',
                                style: subHeader,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: purple,
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: double.infinity,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Users()))),
                                child: Image.asset(
                                    'assets/img/profile-user.png',
                                    height: 50),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Usuarios',
                                style: subHeaderSelected,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: double.infinity,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (() => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideosAdmin()))),
                                child: Image.asset('assets/img/youtubeplay.png',
                                    height: 50),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Videos',
                                style: subHeader,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Image.asset('assets/img/cerrar sesion.png',
                                  height: 50),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Otra funcion (salir?)',
                                style: subHeader,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
