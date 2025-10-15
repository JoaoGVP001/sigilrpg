import 'package:sigilrpg/models/session.dart';

class Campaign {
  final String id;
  final String name;
  final String description;
  final String masterId;
  final List<String> playerIds;
  final List<Session> sessions;
  final List<String> characterIds;
  final DateTime createdAt;

  const Campaign({
    required this.id,
    required this.name,
    required this.description,
    required this.masterId,
    this.playerIds = const [],
    this.sessions = const [],
    this.characterIds = const [],
    required this.createdAt,
  });
}
