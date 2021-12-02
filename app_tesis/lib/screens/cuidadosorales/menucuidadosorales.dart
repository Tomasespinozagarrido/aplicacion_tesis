import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utensilios/cepillos/cepillos.dart';
import '../inicio.dart';
import '../enfermedadesorales/menuenfermedadesorales.dart';

class Menucuidadosorales extends StatefulWidget {
  const Menucuidadosorales({Key? key}) : super(key: key);

  @override
  _MenucuidadosoralesState createState() => _MenucuidadosoralesState();
}

class _MenucuidadosoralesState extends State<Menucuidadosorales> {
  int PaginaActual = 0;
  final PageController MenucuidadosoralesController =
      new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: MenucuidadosoralesController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MenucuidadosoralesMenucuidadosorales(
              PaginaActual: PaginaActual,
              MenucuidadosoralesController: MenucuidadosoralesController),
          Menuebfernedadesorales(),
          Menuebfernedadesorales(),
          Menuebfernedadesorales(),
          Inicio(),
        ],
      ),
    );
  }
}

class MenucuidadosoralesMenucuidadosorales extends StatelessWidget {
  MenucuidadosoralesMenucuidadosorales(
      {required this.PaginaActual, required this.MenucuidadosoralesController});
  int PaginaActual;
  PageController MenucuidadosoralesController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuMenucuidadosorales(
              title: 'Dieta e Hidratación',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              MenucuidadosoralesController: MenucuidadosoralesController),
          MenuMenucuidadosorales(
              title: 'Higiene',
              icon: Icons.home,
              warna: Colors.blue,
              index: 2,
              PaginaActual: PaginaActual,
              MenucuidadosoralesController: MenucuidadosoralesController),
          MenuMenucuidadosorales(
              title: 'Fluoruros',
              icon: Icons.home,
              warna: Colors.blue,
              index: 3,
              PaginaActual: PaginaActual,
              MenucuidadosoralesController: MenucuidadosoralesController),
          /*INICIO BOTON VOLVER*/

          ElevatedButton(
              onPressed: () {
                var animateToPage = MenucuidadosoralesController.animateToPage(
                    4,
                    duration: const Duration(milliseconds: 300),
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

class MenuMenucuidadosorales extends StatelessWidget {
  MenuMenucuidadosorales(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.index,
      required this.PaginaActual,
      required this.MenucuidadosoralesController});
  PageController MenucuidadosoralesController = new PageController();
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
            var animateToPage = MenucuidadosoralesController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
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
                      color: Colors.red,
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
