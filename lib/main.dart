import 'package:flutter/material.dart';
import 'package:tema_4/screens/movie_screen.dart';
import './screens/main_screen.dart';
import './screens/movie_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tema 4',
      home: MainScreen(),
      routes: {
        MainScreen.routeName: (ctx) => MainScreen(),
        MovieScreen.routeName: (ctx) => MovieScreen(),
      },
    );
  }
}
