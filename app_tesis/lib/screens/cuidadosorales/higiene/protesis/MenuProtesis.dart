import 'package:app_tesis/screens/cuidadosorales/higiene/cepillado/HigieneDiaria.dart';
import 'package:app_tesis/screens/cuidadosorales/higiene/cepillado/TecnicaHigiene.dart';
import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../MenuHigiene.dart';

class MenuProtesis extends StatefulWidget {
  const MenuProtesis({Key? key}) : super(key: key);

  @override
  _MenuProtesisState createState() => _MenuProtesisState();
}

class _MenuProtesisState extends State<MenuProtesis> {
  int PaginaActual = 0;
  final PageController MenuProtesisController =
      new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: MenuProtesisController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          MenuProtesisMenuProtesis(
              PaginaActual: PaginaActual,
              MenuProtesisController: MenuProtesisController),
          MenuHigiene(),
          MenuHigiene()
        ],
      ),
    );
  }
}

class MenuProtesisMenuProtesis extends StatelessWidget {
  MenuProtesisMenuProtesis(
      {required this.PaginaActual, required this.MenuProtesisController});
  int PaginaActual;
  PageController MenuProtesisController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuMenuProtesis(
              title: 'Cepillos para protesis',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              MenuProtesisController: MenuProtesisController),

          /*INICIO BOTON VOLVER*/

          ElevatedButton(
              onPressed: () {
                var animateToPage = MenuProtesisController.animateToPage(
                    2, //COLOCAR EL NUMERO DEL INDEX QUE LE CORRESPONDA
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

class MenuMenuProtesis extends StatelessWidget {
  MenuMenuProtesis(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.index,
      required this.PaginaActual,
      required this.MenuProtesisController});
  PageController MenuProtesisController = new PageController();
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
            var animateToPage = MenuProtesisController.animateToPage(index,
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