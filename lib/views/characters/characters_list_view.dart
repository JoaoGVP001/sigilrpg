import 'package:flutter/material.dart';
import 'package:sigilrpg/models/character.dart';
import 'package:sigilrpg/widgets/character_card.dart';
import 'package:sigilrpg/constants/app_routes.dart';

class CharactersListView extends StatelessWidget {
  const CharactersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Character> mock = [
      const Character(
        id: '1',
        name: 'Dante Aligheri',
        playerName: 'Jogador 1',
        origin: 'Investigador',
        characterClass: 'Combatente',
        nex: 15,
      ),
      const Character(
        id: '2',
        name: 'Helena Prado',
        playerName: 'Jogador 2',
        origin: 'Acadêmica',
        characterClass: 'Especialista',
        nex: 10,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Personagens')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: mock.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) => CharacterCard(
          character: mock[i],
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.characters + '/${mock[i].id}',
            arguments: mock[i],
          ),
        ),
      ),
    );
  }
}
