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
        children:[
          DrawerHeader(
            decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Colors.lightBlue,
              Colors.blue
            ])
            ),
            child: Text('Drawer header '),
          ),
          CustomListTile(Icons.person,'Perfil'),
          CustomListTile(Icons.notifications,'Notificaciones'),
          CustomListTile(Icons.settings,'Opciones'),
          CustomListTile(Icons.lock,'cerrar sesión'),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Inicio(),
          Utensilios(),
          Riesgos(),
          Cuidados(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            currentPage = index;
            var animateToPage = pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut);
            setState(() {});
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Utensilios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dangerous),
              label: 'Riesgos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_sharp),
              label: 'Cuidados',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.cyan.shade50),
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

class CustomListTile extends StatelessWidget{
//constructor del custom list tile
  IconData icon;
  String text;

  CustomListTile(this.icon,this.text);
//termino del constructor  
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Colors.cyan,
        onTap: ()=>{},
        child: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Row(
                children:<Widget>[
                  Icon(icon),
                  Padding(padding: const EdgeInsets.all(8.0),
                  child: Text(text,style: TextStyle(
                    fontSize: 16.0,
                    )),
                  )
                ]
              ),
            Icon(Icons.arrow_right)
            ]
          ),
        ),
      ),
    );

  }
}