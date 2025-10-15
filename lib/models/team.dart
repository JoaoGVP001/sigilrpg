class SharedMap {
  final String id;
  final String name;
  final String imageUrl;
  const SharedMap({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

class Note {
  final String id;
  final String title;
  final String content;
  const Note({required this.id, required this.title, required this.content});
}

class Team {
  final String id;
  final String name;
  final String campaignId;
  final List<String> memberIds;
  final List<SharedMap> maps;
  final List<Note> sharedNotes;

  const Team({
    required this.id,
    required this.name,
    required this.campaignId,
    this.memberIds = const [],
    this.maps = const [],
    this.sharedNotes = const [],
  });
}
