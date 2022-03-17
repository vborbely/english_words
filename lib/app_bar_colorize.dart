import 'package:flutter/material.dart';

class AppBarColorize extends StatelessWidget {
  const AppBarColorize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple, Colors.teal])
      ),
    );
  }
}