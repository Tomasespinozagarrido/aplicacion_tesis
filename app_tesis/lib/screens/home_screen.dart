import 'package:app_tesis/screens/riesgos.dart';
import 'package:flutter/material.dart';
import 'inicio.dart';
import 'utensilios.dart';
import 'cuidados.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  final PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.lightBlue, Colors.blue])),
              child: Text('Drawer header '),
            ),
            CustomListTile(Icons.person, 'Perfil'),
            CustomListTile(Icons.notifications, 'Notificaciones'),
            CustomListTile(Icons.settings, 'Opciones'),
            CustomListTile(Icons.lock, 'cerrar sesión'),
          ],
        ),
      ),
      body: Inicio(),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.black12,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const Text('Inicio'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text('Custom Screen'),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
//constructor del custom list tile
  IconData icon;
  String text;

  CustomListTile(this.icon, this.text);
//termino del constructor
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Colors.cyan,
        onTap: () => {},
        child: Container(
          height: 40,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text,
                        style: TextStyle(
                          fontSize: 16.0,
                        )),
                  )
                ]),
                Icon(Icons.arrow_right)
              ]),
        ),
      ),
    );
  }
}
