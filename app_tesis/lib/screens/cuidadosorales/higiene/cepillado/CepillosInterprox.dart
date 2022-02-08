import '../Menucepillado.dart';
import 'package:flutter/material.dart';

class CepillosInterprox extends StatefulWidget {
  const CepillosInterprox({Key? key}) : super(key: key);

  @override
  _CepillosInterproxState createState() => _CepillosInterproxState();
}

class _CepillosInterproxState extends State<CepillosInterprox> {
  int PaginaActual = 0;
  final PageController CepillosInterproxController =
      new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: CepillosInterproxController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CepillosInterproxCepillosInterprox(
              PaginaActual: PaginaActual,
              CepillosInterproxController: CepillosInterproxController),
          MenuCepillado(),
        ],
      ),
    );
  }
}

class CepillosInterproxCepillosInterprox extends StatelessWidget {
  CepillosInterproxCepillosInterprox(
      {required this.PaginaActual, required this.CepillosInterproxController});
  int PaginaActual;
  PageController CepillosInterproxController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          /* INICIO EDITAR */
          Text("Cepillos Interproximales"),
          /*FIN EDITAR */
          /*INICIO BOTON VOLVER*/

          ElevatedButton(
              onPressed: () {
                var animateToPage = CepillosInterproxController.animateToPage(
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