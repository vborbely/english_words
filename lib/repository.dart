

import 'package:english_words/english_words.dart';

final MyRepository repository = MyRepository();

class MyRepository {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  void generateSuggestions(){
    _suggestions.addAll(generateWordPairs().take(10));
  }

  List<WordPair> getAllSuggestions(){
    return _suggestions;
  }


  bool has(WordPair pair){
    return _saved.contains(pair);
  }

  void save(WordPair pair){
    _saved.add(pair);
  }

  void remove(WordPair pair){
    _saved.remove(pair);
  }

  Set<WordPair> getSaved(){
    return _saved;
  }



}