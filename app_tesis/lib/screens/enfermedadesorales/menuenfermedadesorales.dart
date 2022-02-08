import 'package:app_tesis/screens/enfermedadesorales/Cancer.dart';
import 'package:app_tesis/screens/enfermedadesorales/Candidiasis.dart';
import 'package:app_tesis/screens/enfermedadesorales/EnfermedadesPeriodontales.dart';
import 'package:app_tesis/screens/enfermedadesorales/Xerostomia.dart';
import 'package:app_tesis/screens/enfermedadesorales/caries.dart';
import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../utensilios/cepillos/cepillos.dart';
import '../cuidadosorales/menucuidadosorales.dart';
import '../inicio.dart';

class Menuenfermedadesorales extends StatefulWidget {
  const Menuenfermedadesorales({Key? key}) : super(key: key);

  @override
  _MenuenfermedadesoralesState createState() => _MenuenfermedadesoralesState();
}

class _MenuenfermedadesoralesState extends State<Menuenfermedadesorales> {
  int PaginaActual = 0;
  final PageController MenuenfermedadesoralesController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: MenuenfermedadesoralesController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MenuenfermedadesoralesMenuenfermedadesorales(
              PaginaActual: PaginaActual, MenuenfermedadesoralesController: MenuenfermedadesoralesController),
          Caries(),
          EnfermedadesPeriodontales(),
          Candidiasis(),
          Xerostomia(),
          Cancer(),
          Inicio(),
        ],
      ),
    );
  }
}

class MenuenfermedadesoralesMenuenfermedadesorales extends StatelessWidget {
  MenuenfermedadesoralesMenuenfermedadesorales({required this.PaginaActual, required this.MenuenfermedadesoralesController});
  int PaginaActual;
  PageController MenuenfermedadesoralesController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuMenuenfermedadesorales(
              title: 'Caries - Lesiones de caries',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              MenuenfermedadesoralesController: MenuenfermedadesoralesController),
          MenuMenuenfermedadesorales(
              title: 'Enfermedad Periodontal',
              icon: Icons.home,
              warna: Colors.blue,
              index: 2,
              PaginaActual: PaginaActual,
              MenuenfermedadesoralesController: MenuenfermedadesoralesController),
              MenuMenuenfermedadesorales(
              title: 'Candidiasis',
              icon: Icons.home,
              warna: Colors.blue,
              index: 3,
              PaginaActual: PaginaActual,
              MenuenfermedadesoralesController: MenuenfermedadesoralesController),
              MenuMenuenfermedadesorales(
              title: 'Xerostomia - Hiposalivación',
              icon: Icons.home,
              warna: Colors.blue,
              index: 4,
              PaginaActual: PaginaActual,
              MenuenfermedadesoralesController: MenuenfermedadesoralesController),
              MenuMenuenfermedadesorales(
              title: 'Cancer Oral',
              icon: Icons.home,
              warna: Colors.blue,
              index: 5,
              PaginaActual: PaginaActual,
              MenuenfermedadesoralesController: MenuenfermedadesoralesController),

              ElevatedButton(
              onPressed: () {
                var animateToPage =  MenuenfermedadesoralesController.animateToPage(
                    6, //COLOCAR EL NUMERO DEL INDEX QUE LE CORRESPONDA
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

class MenuMenuenfermedadesorales extends StatelessWidget {
  MenuMenuenfermedadesorales(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.index,
      required this.PaginaActual,
      required this.MenuenfermedadesoralesController});
  PageController MenuenfermedadesoralesController = new PageController();
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
            var animateToPage = MenuenfermedadesoralesController.animateToPage(index,
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
