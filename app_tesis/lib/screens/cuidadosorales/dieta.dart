+import 'package:app_tesis/screens/cuidadosorales/menucuidadosorales.dart';
import 'package:flutter/material.dart';

class Dieta extends StatefulWidget {
  const Dieta({Key? key}) : super(key: key);

  @override
  _DietaState createState() => _DietaState();
}

class _DietaState extends State<Dieta> {
  int PaginaActual = 0;
  final PageController DietaController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: DietaController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          DietaDieta(
              PaginaActual: PaginaActual, DietaController: DietaController),
          Menucuidadosorales(),
        ],
      ),
    );
  }
}

class DietaDieta extends StatelessWidget {
  DietaDieta({required this.PaginaActual, required this.DietaController});
  int PaginaActual;
  PageController DietaController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          /* INICIO EDITAR */
          Text("Dieta e Hidratación"),
          /*FIN EDITAR */
          /*INICIO BOTON VOLVER*/

          ElevatedButton(
              onPressed: () {
                var animateToPage = DietaController.animateToPage(
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