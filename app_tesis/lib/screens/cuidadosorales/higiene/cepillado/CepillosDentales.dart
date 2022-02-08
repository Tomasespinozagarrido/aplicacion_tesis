import 'Menucepillado.dart';
import 'package:flutter/material.dart';

class CepillosDentales extends StatefulWidget {
  const CepillosDentales({Key? key}) : super(key: key);

  @override
  _CepillosDentalesState createState() => _CepillosDentalesState();
}

class _CepillosDentalesState extends State<CepillosDentales> {
  int PaginaActual = 0;
  final PageController CepillosDentalesController =
      new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: CepillosDentalesController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CepillosDentalesCepillosDentales(
              PaginaActual: PaginaActual,
              CepillosDentalesController: CepillosDentalesController),
          MenuCepillado(),
        ],
      ),
    );
  }
}

class CepillosDentalesCepillosDentales extends StatelessWidget {
  CepillosDentalesCepillosDentales(
      {required this.PaginaActual, required this.CepillosDentalesController});
  int PaginaActual;
  PageController CepillosDentalesController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          /* INICIO EDITAR */
          Text("Cepillos Dentales"),
          /*FIN EDITAR */
          /*INICIO BOTON VOLVER*/

          ElevatedButton(
              onPressed: () {
                var animateToPage = CepillosDentalesController.animateToPage(
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