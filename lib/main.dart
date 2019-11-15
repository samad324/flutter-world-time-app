import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'Screens/loading.dart';
import 'Screens/choose_location.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/changeLocation': (context) => ChooseLocation(),
      },
      initialRoute: '/',
    ));
