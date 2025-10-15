import 'package:flutter/foundation.dart';
import 'package:sigilrpg/utils/dice.dart';

class DiceController extends ChangeNotifier {
  final List<DiceRollResult> _history = <DiceRollResult>[];

  List<DiceRollResult> get history => List.unmodifiable(_history);

  DiceRollResult rollD20({int modifier = 0}) {
    final result = Dice.d20(modifier: modifier);
    _history.insert(0, result);
    notifyListeners();
    return result;
  }

  DiceRollResult roll({
    required int count,
    required int sides,
    int modifier = 0,
  }) {
    final result = Dice.roll(count: count, sides: sides, modifier: modifier);
    _history.insert(0, result);
    notifyListeners();
    return result;
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }
}
