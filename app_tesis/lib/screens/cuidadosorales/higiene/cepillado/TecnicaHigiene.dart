import 'Menucepillado.dart';
import 'package:flutter/material.dart';

class TecnicaHigiene extends StatefulWidget {
  const TecnicaHigiene({Key? key}) : super(key: key);

  @override
  _TecnicaHigieneState createState() => _TecnicaHigieneState();
}

class _TecnicaHigieneState extends State<TecnicaHigiene> {
  int PaginaActual = 0;
  final PageController TecnicaHigieneController =
      new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: TecnicaHigieneController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          TecnicaHigieneTecnicaHigiene(
              PaginaActual: PaginaActual,
              TecnicaHigieneController: TecnicaHigieneController),
          MenuCepillado(),
        ],
      ),
    );
  }
}

class TecnicaHigieneTecnicaHigiene extends StatelessWidget {
  TecnicaHigieneTecnicaHigiene(
      {required this.PaginaActual, required this.TecnicaHigieneController});
  int PaginaActual;
  PageController TecnicaHigieneController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          /* INICIO EDITAR */
          Text("Técnica de higiene"),
          /*FIN EDITAR */
          /*INICIO BOTON VOLVER*/

          ElevatedButton(
              onPressed: () {
                var animateToPage = TecnicaHigieneController.animateToPage(
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