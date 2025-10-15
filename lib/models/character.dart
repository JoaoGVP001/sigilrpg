class Character {
  final String id;
  final String name;
  final String playerName;
  final String origin;
  final String characterClass;
  final int nex;
  final String? avatarUrl;

  const Character({
    required this.id,
    required this.name,
    required this.playerName,
    required this.origin,
    required this.characterClass,
    required this.nex,
    this.avatarUrl,
  });
}
