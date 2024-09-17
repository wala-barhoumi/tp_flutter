import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
appBar: AppBar(
 title: Text('Disposition en Colonne et Ligne'),
 ),
 body: Column(
 children: [
 Row(
 children: [
 Container(
 color: Colors.red,
 width: 100,
 height: 100,
 ),
 Container(
 color: Colors.green,
 width: 100,
 height: 100,
 ),
 ],
 ),
 Container(
 color: Colors.blue,
 width: double.infinity,
 height: 100,),],), ),
 );
 }
}