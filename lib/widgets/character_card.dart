import 'package:flutter/material.dart';
import 'package:sigilrpg/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final VoidCallback? onTap;
  const CharacterCard({super.key, required this.character, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: character.avatarUrl != null
              ? NetworkImage(character.avatarUrl!)
              : null,
          child: character.avatarUrl == null ? const Icon(Icons.person) : null,
        ),
        title: Text(character.name),
        subtitle: Text(
          '${character.origin} • ${character.characterClass} • NEX ${character.nex}%',
        ),
        onTap: onTap,
      ),
    );
  }
}
