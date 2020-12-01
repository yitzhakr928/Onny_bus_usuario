import 'package:flutter/material.dart';
import 'package:onny_bus_usuario/src/HomePage.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: HomePage(),
    );
  }
}