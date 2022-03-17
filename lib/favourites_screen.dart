import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/repository.dart';

import 'app_bar_colorize.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = repository.getSaved().map((WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
            style: Theme.of(context).textTheme.bodyText2
        ),
      );
    });
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_outlined),
        ),
        flexibleSpace: AppBarColorize(),
        title: const Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}
