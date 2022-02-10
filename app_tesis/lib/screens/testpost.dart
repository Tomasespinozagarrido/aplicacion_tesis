import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'utensilios/cepillos/cepillos.dart';
import 'inicio.dart';

/*class TestPost extends StatefulWidget {
  const TestPost({Key? key}) : super(key: key);

  @override
  _TestPostState createState() => _TestPostState();
}

class _TestPostState extends State<TestPost> {
  int PaginaActual = 0;
  final PageController utensilioController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: utensilioController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          InicioTestPost(
              PaginaActual: PaginaActual,
              utensilioController: utensilioController),
          Inicio(),
          cepillos(),
        ],
      ),
    );
  }
}

class InicioTestPost extends StatelessWidget {
  InicioTestPost(
      {required this.PaginaActual, required this.utensilioController});
  int PaginaActual;
  PageController utensilioController = new PageController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MenuTestPost(
              title: 'Cepillos dentales',
              icon: Icons.home,
              warna: Colors.blue,
              index: 1,
              PaginaActual: PaginaActual,
              utensilioController: utensilioController),
          MenuTestPost(
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

class MenuTestPost extends StatelessWidget {
  MenuTestPost(
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
class TestPost extends StatefulWidget {
  const TestPost({Key? key}) : super(key: key);
  @override
  _TestPostState createState() => _TestPostState();
}

class User {
  final int id;
  final String nombre;
  final String email;
  final String password;
  const User({
    required this.id,
    required this.nombre,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}

class Respuesta {
  final String resp;
  const Respuesta({
    required this.resp,
  });

  factory Respuesta.fromJson(Map<String, dynamic> json) {
    return Respuesta(resp: json['resp'] as String);
  }
}

class _TestPostState extends State<TestPost> {
  Future<Respuesta> fetchRespuesta() async {
    var apiurl = '?nombre=User1';

    String url = "https://frozen-castle-33815.herokuapp.com/users_login.php";
    final response = await http.get(Uri.parse(url + apiurl));
    var datos = ' ';
    Iterable datos2 = jsonDecode(response.body);
    print('${datos2}!');

    for (var i = 1; i < response.body.length - 1; i++) {
      datos = await '${datos}${response.body[i]}';
    }

    print(response.body.length);
    debugPrint(datos);
    // Map<String, dynamic> datos2 = jsonDecode(datos);
    // print('${datos2['nombre']}!');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Respuesta.fromJson(jsonDecode(datos));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  late Future<Respuesta> futureRespuesta;
  @override
  void initState() {
    super.initState();
    futureRespuesta = fetchRespuesta();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Respuesta>(
          future: futureRespuesta,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.resp);
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
