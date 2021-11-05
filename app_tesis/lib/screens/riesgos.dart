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
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget> [
          Opciones('Caries, Lesiones de Caries',  Icons.cases),
          Opciones('Enfermedad periodontal',  Icons.cast),
          Opciones( 'Candidiasis',  Icons.casino),
          Opciones('Xerostimia Hiposalivación',  Icons.cast_for_education),
        ],
      ),
    );
  }
}


class Opciones extends StatelessWidget{

  String titulo;
  IconData icon;


  Opciones(this.titulo, this.icon,);
  @override
  Widget build(BuildContext context){
    return  Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){},
              splashColor: Colors.cyan,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(icon,size:70.0,),
                    Text(titulo),
                  ],
                ),
              ),
            ),
          );
  }
}