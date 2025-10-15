import 'package:flutter/foundation.dart';
import 'package:sigilrpg/models/team.dart';

class TeamsController extends ChangeNotifier {
  final List<Team> _teams = <Team>[];

  List<Team> get teams => List.unmodifiable(_teams);

  void add(Team t) {
    _teams.add(t);
    notifyListeners();
  }
}
