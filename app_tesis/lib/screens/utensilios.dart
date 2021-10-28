import 'package:flutter/material.dart';

class Utensilios extends StatefulWidget {
  const Utensilios({Key? key}) : super(key: key);

  @override
  _UtensiliosState createState() => _UtensiliosState();
}

class _UtensiliosState extends State<Utensilios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: Text("Utensilios"),
      ),
    );
  }
}
