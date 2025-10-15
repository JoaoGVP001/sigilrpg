import 'package:flutter/foundation.dart';
import 'package:sigilrpg/models/character.dart';

class CharactersController extends ChangeNotifier {
  final List<Character> _characters = <Character>[];

  List<Character> get characters => List.unmodifiable(_characters);

  void add(Character c) {
    _characters.add(c);
    notifyListeners();
  }

  void removeById(String id) {
    _characters.removeWhere((c) => c.id == id);
    notifyListeners();
  }
}
