import 'package:flutter/material.dart';
//import 'package:flutter_application_2/main_page.dart';
import 'package:flutter_application_2/menu_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tela de Início',
      home: MenuView(),
    );
  }
}