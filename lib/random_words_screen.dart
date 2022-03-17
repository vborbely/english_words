import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_demo/repository.dart';

import 'app_bar_colorize.dart';
import 'favourites_screen.dart';

class RandomWordsScreen extends StatefulWidget {
  @override
  RandomWordsScreenState createState() => new RandomWordsScreenState();
}

class RandomWordsScreenState extends State<RandomWordsScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        flexibleSpace: AppBarColorize(),
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestion(),
    );
  }

  Widget _buildSuggestion() {
    final suggestions = repository.getAllSuggestions();

    return ListView.builder(
    // return GridView.builder(
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return new Divider( endIndent: 50, thickness: 0.8,);
        }
        final int index = i ~/ 2;
        // final int index = i;

        if (index >= suggestions.length) {
          repository.generateSuggestions();
        }
        return _buildRow(suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool _alreadySaved = repository.has(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _alreadySaved ? Theme.of(context).textTheme.bodyText2 : Theme.of(context).textTheme.bodyText1,
      ),
      trailing: new Icon(
        _alreadySaved ? Icons.star : Icons.star_border,
        color: _alreadySaved ? Colors.orangeAccent : null,
      ),
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            repository.remove(pair);
          } else {
            repository.save(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => FavouritesScreen()));
  }
}
