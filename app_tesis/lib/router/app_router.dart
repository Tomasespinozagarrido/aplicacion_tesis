import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';

class AppRoutes {
  static const initialRoute = '/home';
  static final menuOption = <MenuOption>[
    MenuOption(route: '/home', icon: Icons.home, nombre: 'Inicio', screen: HomeScreen()),
    MenuOption(route: '/home', icon: Icons.home, nombre: 'Inicio', screen: HomeScreen()),
    MenuOption(route: '/home', icon: Icons.home, nombre: 'Inicio', screen: HomeScreen()),
  ]
}
