import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'utensilios/cepillos/cepillos.dart';
import 'cuidadosorales/menucuidadosorales.dart';
import 'enfermedadesorales/menuenfermedadesorales.dart';
import 'inicio.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int PaginaActual = 0;
  final PageController InicioController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: InicioController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          InicioInicio(
              PaginaActual: PaginaActual, InicioController: InicioController),
          Menucuidadosorales(),
          Menuebfernedadesorales(),
        ],
      ),
    );
  }
}

class InicioInicio extends StatelessWidget {
  InicioInicio({required this.PaginaActual, required this.InicioController});
  int PaginaActual;
  PageController InicioController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuInicio(
              title: 'Cuidados de Salud Oral',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              InicioController: InicioController),
          MenuInicio(
              title: 'Enfermedades Orales',
              icon: Icons.home,
              warna: Colors.blue,
              index: 2,
              PaginaActual: PaginaActual,
              InicioController: InicioController),
        ],
      ),
    );
  }
}

class MenuInicio extends StatelessWidget {
  MenuInicio(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.index,
      required this.PaginaActual,
      required this.InicioController});
  PageController InicioController = new PageController();
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
            var animateToPage = InicioController.animateToPage(index,
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
                    color: Colors.cyan, blurRadius: 12, offset: Offset(3, 3))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Image(image: AssetImage('assets/images/Logo_app200p.png')),
                Icon(
                  icon,
                  size: 50.0,
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
