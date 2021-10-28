import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    const Text("asdasdasd");

    return Container(
      color: Colors.red,
      child: const Center(
        child: Text("Bienvenidos"),
      ),
    );
  }
}
