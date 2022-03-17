import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/random_words_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18.0,
            color: Colors.black54,
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: 'Welcome to Flutter',
      home: RandomWordsScreen(),
    );
  }
}
