import 'package:flutter/material.dart';
import 'package:flutter_app/Calculator.dart';
import 'HomeScreen.dart';
import 'package:flutter_app/Notes.dart';
import 'package:flutter_app/Contact.dart';

// https://www.youtube.com/watch?v=hWW9SUXdbjk database için referans


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/" : (context) => HomeScreen(),
        "/calculator" : (context) => Calculator(),
        "/notes" : (context) => NotepadApp(),
        "/contacts" : (context) => HomePage(),
      },
    );
  }
}






