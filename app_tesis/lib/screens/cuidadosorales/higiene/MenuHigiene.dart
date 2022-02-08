import 'package:app_tesis/screens/cuidadosorales/higiene/cepillado/Menucepillado.dart';
import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../menucuidadosorales.dart';
import 'protesis/MenuProtesis.dart';

class MenuHigiene extends StatefulWidget {
  const MenuHigiene({Key? key}) : super(key: key);

  @override
  _MenuHigieneState createState() => _MenuHigieneState();
}

class _MenuHigieneState extends State<MenuHigiene> {
  int PaginaActual = 0;
  final PageController MenuHigieneController =
      new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: MenuHigieneController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MenuHigieneMenuHigiene(
              PaginaActual: PaginaActual,
              MenuHigieneController: MenuHigieneController),
          MenuCepillado(),
          MenuProtesis(),
          Menucuidadosorales(),
        ],
      ),
    );
  }
}

class MenuHigieneMenuHigiene extends StatelessWidget {
  MenuHigieneMenuHigiene(
      {required this.PaginaActual, required this.MenuHigieneController});
  int PaginaActual;
  PageController MenuHigieneController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuMenuHigiene(
              title: 'Cepillado',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              MenuHigieneController: MenuHigieneController),
          MenuMenuHigiene(
              title: 'Higiene protésica',
              icon: Icons.home,
              warna: Colors.blue,
              index: 2,
              PaginaActual: PaginaActual,
              MenuHigieneController: MenuHigieneController),
          /*INICIO BOTON VOLVER*/

          ElevatedButton(
              onPressed: () {
                var animateToPage = MenuHigieneController.animateToPage(
                    3, //COLOCAR EL NUMERO DEL INDEX QUE LE CORRESPONDA
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.easeOut);
              },
              child: Text("Volver"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: Size.fromWidth(250),
                  minimumSize: Size.fromHeight(50),
                  textStyle: TextStyle(fontSize: 30),
                  primary: Colors.cyan,
                  shadowColor: Colors.blue,
                  onPrimary: Colors.white))
          // FIN BOTON VOLVER
        ],
      ),
    );
  }
}

class MenuMenuHigiene extends StatelessWidget {
  MenuMenuHigiene(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.index,
      required this.PaginaActual,
      required this.MenuHigieneController});
  PageController MenuHigieneController = new PageController();
  final String title;
  final int index;
  final IconData icon;
  final MaterialColor warna;
  int PaginaActual;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, //AJUSTAR TAMAÑO DE CARDS
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            PaginaActual = index;
            var animateToPage = MenuHigieneController.animateToPage(index,
                duration: const Duration(milliseconds: 1),
                curve: Curves.easeOut);
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  colors: [Color(0xFF213B6C), Color(0xFF0059A5)]),
              boxShadow: [
                BoxShadow(
                    color: Colors.pink, blurRadius: 12, offset: Offset(3, 3))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Image(image: AssetImage('assets/images/Logo_app200p.png')),
                Icon(
                  icon,
                  size: 70.0,
                  color: warna,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      letterSpacing: 0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}