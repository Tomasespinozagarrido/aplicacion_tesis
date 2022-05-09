import 'package:app_tesis/router/app_router.dart';
import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hola Mundo',
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
