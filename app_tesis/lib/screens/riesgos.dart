import 'package:flutter/material.dart';

class Riesgos extends StatefulWidget {
  const Riesgos({Key? key}) : super(key: key);

  @override
  _RiesgosState createState() => _RiesgosState();
}

class _RiesgosState extends State<Riesgos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text("Riesgos"),
      ),
    );
  }
}
