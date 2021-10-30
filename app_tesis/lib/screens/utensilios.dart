import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
    final response = await http.get(Uri.parse("http://10.0.2.2:4000/users/1"));
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
