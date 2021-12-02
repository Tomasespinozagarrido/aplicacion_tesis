import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utensilios/cepillos/cepillos.dart';
import '../inicio.dart';

class Menuebfernedadesorales extends StatefulWidget {
  const Menuebfernedadesorales({Key? key}) : super(key: key);

  @override
  _MenuebfernedadesoralesState createState() => _MenuebfernedadesoralesState();
}

class _MenuebfernedadesoralesState extends State<Menuebfernedadesorales> {
  int PaginaActual = 0;
  final PageController MenuebfernedadesoralesController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: MenuebfernedadesoralesController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MenuebfernedadesoralesMenuebfernedadesorales(
              PaginaActual: PaginaActual, MenuebfernedadesoralesController: MenuebfernedadesoralesController),
        ],
      ),
    );
  }
}

class MenuebfernedadesoralesMenuebfernedadesorales extends StatelessWidget {
  MenuebfernedadesoralesMenuebfernedadesorales({required this.PaginaActual, required this.MenuebfernedadesoralesController});
  int PaginaActual;
  PageController MenuebfernedadesoralesController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuMenuebfernedadesorales(
              title: 'Caries - Lesiones de caries',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              MenuebfernedadesoralesController: MenuebfernedadesoralesController),
          MenuMenuebfernedadesorales(
              title: 'Enfermedad Periodontal',
              icon: Icons.home,
              warna: Colors.blue,
              index: 2,
              PaginaActual: PaginaActual,
              MenuebfernedadesoralesController: MenuebfernedadesoralesController),
              MenuMenuebfernedadesorales(
              title: 'Candidiasis',
              icon: Icons.home,
              warna: Colors.blue,
              index: 3,
              PaginaActual: PaginaActual,
              MenuebfernedadesoralesController: MenuebfernedadesoralesController),
              MenuMenuebfernedadesorales(
              title: 'Xerostomia - Hiposalivación',
              icon: Icons.home,
              warna: Colors.blue,
              index: 4,
              PaginaActual: PaginaActual,
              MenuebfernedadesoralesController: MenuebfernedadesoralesController),
              MenuMenuebfernedadesorales(
              title: 'Cancer Oral',
              icon: Icons.home,
              warna: Colors.blue,
              index: 5,
              PaginaActual: PaginaActual,
              MenuebfernedadesoralesController: MenuebfernedadesoralesController),
        ],
      ),
    );
  }
}

class MenuMenuebfernedadesorales extends StatelessWidget {
  MenuMenuebfernedadesorales(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.index,
      required this.PaginaActual,
      required this.MenuebfernedadesoralesController});
  PageController MenuebfernedadesoralesController = new PageController();
  final String title;
  final int index;
  final IconData icon;
  final MaterialColor warna;
  int PaginaActual;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, //AJUSTAR TAMAÑO DE CARDS
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            PaginaActual = index;
            var animateToPage = MenuebfernedadesoralesController.animateToPage(index,
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
                  size: 30.0,
                  color: warna,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 22,
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
