import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'utensilios/cepillos/cepillos.dart';
import 'inicio.dart';

/*class Utensilios extends StatefulWidget {
  const Utensilios({Key? key}) : super(key: key);

  @override
  _UtensiliosState createState() => _UtensiliosState();
}

class _UtensiliosState extends State<Utensilios> {
  int PaginaActual = 0;
  final PageController utensilioController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: utensilioController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          InicioUtensilios(
              PaginaActual: PaginaActual,
              utensilioController: utensilioController),
          Inicio(),
          cepillos(),
        ],
      ),
    );
  }
}

class InicioUtensilios extends StatelessWidget {
  InicioUtensilios(
      {required this.PaginaActual, required this.utensilioController});
  int PaginaActual;
  PageController utensilioController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuUtensilios(
              title: 'Cepillos dentales',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              utensilioController: utensilioController),
          MenuUtensilios(
              title: 'Pastas dentales',
              icon: Icons.home,
              warna: Colors.blue,
              index: 2,
              PaginaActual: PaginaActual,
              utensilioController: utensilioController),
        ],
      ),
    );
  }
}

class MenuUtensilios extends StatelessWidget {
  MenuUtensilios(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.index,
      required this.PaginaActual,
      required this.utensilioController});
  PageController utensilioController = new PageController();
  final String title;
  final int index;
  final IconData icon;
  final MaterialColor warna;
  int PaginaActual;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            PaginaActual = index;
            var animateToPage = utensilioController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  colors: [Color(0xFF213B6C), Color(0xFF0059A5)]),
              boxShadow: [
                BoxShadow(
                    color: Colors.pink, blurRadius: 12, offset: Offset(3, 3))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Image(image: AssetImage('assets/images/Logo_app200p.png')),
                Icon(
                  icon,
                  size: 70.0,
                  color: warna,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Roboto',
                      fontSize: 24,
                      letterSpacing: 0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}



*/
class Utensilios extends StatefulWidget {
  const Utensilios({Key? key}) : super(key: key);
  @override
  _UtensiliosState createState() => _UtensiliosState();
}

class User {
  final int id;
  final String nombre;
  final String email;
  const User({
    required this.id,
    required this.nombre,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
    );
  }
}

class _UtensiliosState extends State<Utensilios> {
  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse(
        "https://frozen-castle-33815.herokuapp.com/users_GETALL.php"));
    var datos = ' ';
    for (var i = 1; i < response.body.length - 1; i++) {
      datos = await '${datos}${response.body[i]}';
    }
    debugPrint(datos);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(datos));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<User> futureUser;
  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.nombre);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
