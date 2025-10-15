import 'package:flutter/material.dart';
import 'package:sigilrpg/constants/app_colors.dart';
import 'package:sigilrpg/models/character.dart';
import 'package:sigilrpg/widgets/attribute_circle.dart';
import 'package:sigilrpg/widgets/health_bar.dart';

class CharacterDetailView extends StatelessWidget {
  final Character character;
  const CharacterDetailView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(character.name),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Combate'),
              Tab(text: 'Habilidades'),
              Tab(text: 'Rituais'),
              Tab(text: 'Inventário'),
              Tab(text: 'Descrição'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _CombatTab(character: character),
            const Center(child: Text('Habilidades (placeholder)')),
            const Center(child: Text('Rituais (placeholder)')),
            const Center(child: Text('Inventário (placeholder)')),
            const Center(child: Text('Descrição (placeholder)')),
          ],
        ),
      ),
    );
  }
}

class _CombatTab extends StatelessWidget {
  final Character character;
  const _CombatTab({required this.character});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AttributeCircle(label: 'AGI', value: 1),
              AttributeCircle(label: 'INT', value: 1),
              AttributeCircle(label: 'VIG', value: 1),
              AttributeCircle(label: 'PRE', value: 1),
              AttributeCircle(label: 'FOR', value: 1),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HealthBar(label: 'PV', current: 20, max: 30),
                SizedBox(height: 12),
                HealthBar(
                  label: 'PE',
                  current: 8,
                  max: 12,
                  color: Colors.blueAccent,
                ),
                SizedBox(height: 12),
                HealthBar(
                  label: 'PS',
                  current: 10,
                  max: 15,
                  color: Colors.purpleAccent,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Defesa: 12',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                const Text('Resistências: Física 2, Balística 1, Mental 0'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
