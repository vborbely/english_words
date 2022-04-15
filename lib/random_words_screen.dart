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
  List _suggestions = repository.getAllSuggestions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppBarColorize(),
        title: Column(
          children: [
            Text('Startup Name Generator'),
            Text(
              '${_suggestions.length} items',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestion(),
    );
  }

  Widget _buildSuggestion() {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent) {
          repository.generateSuggestions();
          setState(() {});
        }
        return true;
      },
      child: ListView.builder(
        itemCount: _suggestions.length,
        // GridView.builder(
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int index) {
          return _buildRow(_suggestions[index]);
        },
      ),
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool _alreadySaved = repository.has(pair);
    return Column(
      children: [
        ListTile(
          title: Text(
            pair.asPascalCase,
            style: _alreadySaved ? Theme.of(context).textTheme.bodyText2 : Theme.of(context).textTheme.bodyText1,
          ),
          trailing: Icon(
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
        ),
        Divider(
          endIndent: 50,
          thickness: 0.8,
        )
      ],
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FavouritesScreen()));
  }
}
