import 'package:band_names/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      
      //Agregar una Ruta Inicial
      initialRoute: 'home',
      routes: {
        'home':(_)=> HomePage()
      },
    );
  }
}