import 'package:flutter/material.dart';
import 'package:timezone/pages/Home.dart';
import 'package:timezone/pages/Loading.dart';
import 'package:timezone/pages/Location.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    ),
  );
}
