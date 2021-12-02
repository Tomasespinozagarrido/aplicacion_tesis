import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utensilios/cepillos/cepillos.dart';
import '../inicio.dart';

class Menucuidadosorales extends StatefulWidget {
  const Menucuidadosorales({Key? key}) : super(key: key);

  @override
  _MenucuidadosoralesState createState() => _MenucuidadosoralesState();
}

class _MenucuidadosoralesState extends State<Menucuidadosorales> {
  int PaginaActual = 0;
  final PageController MenucuidadosoralesController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: MenucuidadosoralesController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MenucuidadosoralesMenucuidadosorales(
              PaginaActual: PaginaActual, MenucuidadosoralesController: MenucuidadosoralesController),

        ],
      ),
    );
  }
}

class MenucuidadosoralesMenucuidadosorales extends StatelessWidget {
  MenucuidadosoralesMenucuidadosorales({required this.PaginaActual, required this.MenucuidadosoralesController});
  int PaginaActual;
  PageController MenucuidadosoralesController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuMenucuidadosorales(
              title: 'Cuidados de Salud Oral',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              MenucuidadosoralesController: MenucuidadosoralesController),
          MenuMenucuidadosorales(
              title: 'Enfermedades Orales',
              icon: Icons.home,
              warna: Colors.blue,
              index: 2,
              PaginaActual: PaginaActual,
              MenucuidadosoralesController: MenucuidadosoralesController),
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
            var animateToPage = MenucuidadosoralesController.animateToPage(index,
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
