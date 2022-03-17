import 'package:flutter/material.dart';
import 'pages/choose_location.dart';
import 'pages/loading.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
