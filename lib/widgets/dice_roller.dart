import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigilrpg/controllers/dicecontroller.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final TextEditingController _count = TextEditingController(text: '1');
  final TextEditingController _sides = TextEditingController(text: '20');
  final TextEditingController _mod = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    final dice = context.watch<DiceController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: _numberField('Qtd', _count)),
            const SizedBox(width: 8),
            Expanded(child: _numberField('Lados', _sides)),
            const SizedBox(width: 8),
            Expanded(child: _numberField('Mod', _mod)),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                final c = int.tryParse(_count.text) ?? 1;
                final s = int.tryParse(_sides.text) ?? 20;
                final m = int.tryParse(_mod.text) ?? 0;
                dice.roll(count: c, sides: s, modifier: m);
              },
              child: const Text('Rolar'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text('Histórico', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...dice.history.map(
          (h) => ListTile(
            dense: true,
            title: Text('Rolagens: ${h.rolls.join(', ')}'),
            trailing: Text('Total: ${h.total}'),
          ),
        ),
      ],
    );
  }

  Widget _numberField(String label, TextEditingController c) {
    return TextField(
      controller: c,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    );
  }
}
