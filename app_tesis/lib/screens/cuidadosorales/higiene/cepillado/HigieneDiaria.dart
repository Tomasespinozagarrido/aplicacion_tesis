import 'Menucepillado.dart';
import 'package:flutter/material.dart';

class HigieneDiaria extends StatefulWidget {
  const HigieneDiaria({Key? key}) : super(key: key);

  @override
  _HigieneDiariaState createState() => _HigieneDiariaState();
}

class _HigieneDiariaState extends State<HigieneDiaria> {
  int PaginaActual = 0;
  final PageController HigieneDiariaController =
      new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: HigieneDiariaController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HigieneDiariaHigieneDiaria(
              PaginaActual: PaginaActual,
              HigieneDiariaController: HigieneDiariaController),
          MenuCepillado(),
        ],
      ),
    );
  }
}

class HigieneDiariaHigieneDiaria extends StatelessWidget {
  HigieneDiariaHigieneDiaria(
      {required this.PaginaActual, required this.HigieneDiariaController});
  int PaginaActual;
  PageController HigieneDiariaController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          /* INICIO EDITAR */
          Text("Momentos de Higienización díaria"),
          /*FIN EDITAR */
          /*INICIO BOTON VOLVER*/

          ElevatedButton(
              onPressed: () {
                var animateToPage = HigieneDiariaController.animateToPage(
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