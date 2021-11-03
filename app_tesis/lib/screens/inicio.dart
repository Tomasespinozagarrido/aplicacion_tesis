import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Bienvenidos',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 50),
            textScaleFactor: 1,
          ),
        ),
        Image(
            image: AssetImage('assets/images/Logo_app200p.png'),
            fit: BoxFit.fitHeight),
        Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(
              'En esta app se pretende dar informacion de cuidado de la boca de pacientes que no pueden hacerlo por ellos mismos, en el menu de abajo hay 3 apartados: el 2 es para los Elementos de hingiene, el 3 es para las enfermedades orales y el 4 es para el cuidado de la salud oral',
              textAlign: TextAlign.justify),
        )
      ],
    );
  }
}
