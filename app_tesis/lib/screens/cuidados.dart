import 'package:flutter/material.dart';

class Cuidados extends StatefulWidget {
  const Cuidados({Key? key}) : super(key: key);

  @override
  _CuidadosState createState() => _CuidadosState();
}

class _CuidadosState extends State<Cuidados> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text("Cuidados"),
      ),
    );
  }
}
