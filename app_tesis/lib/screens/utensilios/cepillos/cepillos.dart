import 'package:flutter/material.dart';

class Cepillos extends StatefulWidget {
  const Cepillos({Key? key}) : super(key: key);

  @override
  _CepillosState createState() => _CepillosState();
}

class _CepillosState extends State<Cepillos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text("CEPILLOS"),
      ),
    );
  }
}
