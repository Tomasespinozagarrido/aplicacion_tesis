import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Bienvenidos'),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
