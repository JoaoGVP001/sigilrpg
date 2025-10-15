import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigilrpg/controllers/dicecontroller.dart';
import 'package:sigilrpg/widgets/dice_roller.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiceController(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Rolador de Dados')),
        body: const Padding(padding: EdgeInsets.all(16), child: DiceRoller()),
      ),
    );
  }
}
