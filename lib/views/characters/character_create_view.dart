import 'package:flutter/material.dart';

class CharacterCreateView extends StatefulWidget {
  const CharacterCreateView({super.key});

  @override
  State<CharacterCreateView> createState() => _CharacterCreateViewState();
}

class _CharacterCreateViewState extends State<CharacterCreateView> {
  int _currentStep = 0;

  // Step 1: Básicas
  final _formBasics = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _playerCtrl = TextEditingController();
  int _nex = 5; // percent steps of 5 for simplicity
  String? _avatarUrl;

  // Step 2: Atributos (pontos)
  int _agi = 1, _int = 1, _vig = 1, _pre = 1, _for = 1;
  int get _attributesTotal => _agi + _int + _vig + _pre + _for;
  int get _pointsAvailable => _pointsFromNex(_nex) - _attributesTotal;

  // Step 3: Origem
  final List<String> _origens = const [
    'Policial',
    'Investigador',
    'Acadêmico',
    'Operário',
  ];
  String? _origin;

  // Step 4: Classe
  final List<String> _classes = const [
    'Combatente',
    'Especialista',
    'Ocultista',
  ];
  String? _clazz;

  // Step 5: Perícias/Habilidades (mock)
  final List<String> _skills = const [
    'Acrobacia',
    'Atletismo',
    'Percepção',
    'Investigação',
    'Luta',
    'Pontaria',
  ];
  final Set<String> _selectedSkills = <String>{};

  final List<String> _abilities = const ['Foco', 'Determinação', 'Intuição'];
  final Set<String> _selectedAbilities = <String>{};

  // Step 6: Equipamento Inicial (mock)
  final List<String> _equipment = const [
    'Pistola 9mm',
    'Kit Médico',
    'Lanterna',
    'Rádio',
  ];
  final Set<String> _selectedEquipment = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Personagem')),
      body: Stepper(
        currentStep: _currentStep,
        type: StepperType.vertical,
        onStepTapped: (i) => setState(() => _currentStep = i),
        onStepContinue: _onContinue,
        onStepCancel: _onBack,
        controlsBuilder: (context, details) {
          final isLast = _currentStep == 5;
          return Row(
            children: [
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text(isLast ? 'Concluir' : 'Continuar'),
              ),
              const SizedBox(width: 12),
              if (_currentStep > 0)
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text('Voltar'),
                ),
            ],
          );
        },
        steps: [
          Step(
            title: const Text('Informações Básicas'),
            isActive: _currentStep >= 0,
            state: _stepState(0),
            content: Form(
              key: _formBasics,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Personagem',
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Informe o nome'
                        : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _playerCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Jogador Responsável',
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Informe o jogador'
                        : null,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text('NEX:'),
                      Expanded(
                        child: Slider(
                          min: 5,
                          max: 50,
                          divisions: 9,
                          value: _nex.toDouble(),
                          label: '$_nex% (${_pointsFromNex(_nex)} pts)',
                          onChanged: (v) => setState(() => _nex = v.round()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Avatar URL (opcional)',
                    ),
                    onChanged: (v) =>
                        _avatarUrl = v.trim().isEmpty ? null : v.trim(),
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Atributos'),
            isActive: _currentStep >= 1,
            state: _stepState(1),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pontos disponíveis: ${_pointsAvailable >= 0 ? _pointsAvailable : 0}',
                ),
                const SizedBox(height: 8),
                _attrRow('AGI', _agi, (v) => setState(() => _agi = v)),
                _attrRow('INT', _int, (v) => setState(() => _int = v)),
                _attrRow('VIG', _vig, (v) => setState(() => _vig = v)),
                _attrRow('PRE', _pre, (v) => setState(() => _pre = v)),
                _attrRow('FOR', _for, (v) => setState(() => _for = v)),
              ],
            ),
          ),
          Step(
            title: const Text('Origem'),
            isActive: _currentStep >= 2,
            state: _stepState(2),
            content: DropdownButtonFormField<String>(
              value: _origin,
              decoration: const InputDecoration(
                labelText: 'Selecione a origem',
              ),
              items: _origens
                  .map((o) => DropdownMenuItem(value: o, child: Text(o)))
                  .toList(),
              onChanged: (v) => setState(() => _origin = v),
              validator: (v) => v == null ? 'Escolha uma origem' : null,
            ),
          ),
          Step(
            title: const Text('Classe'),
            isActive: _currentStep >= 3,
            state: _stepState(3),
            content: DropdownButtonFormField<String>(
              value: _clazz,
              decoration: const InputDecoration(
                labelText: 'Selecione a classe',
              ),
              items: _classes
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => _clazz = v),
              validator: (v) => v == null ? 'Escolha uma classe' : null,
            ),
          ),
          Step(
            title: const Text('Perícias e Habilidades'),
            isActive: _currentStep >= 4,
            state: _stepState(4),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Perícias'),
                Wrap(
                  spacing: 8,
                  children: _skills
                      .map(
                        (s) => FilterChip(
                          label: Text(s),
                          selected: _selectedSkills.contains(s),
                          onSelected: (on) => setState(() {
                            if (on) {
                              _selectedSkills.add(s);
                            } else {
                              _selectedSkills.remove(s);
                            }
                          }),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 12),
                const Text('Habilidades'),
                Wrap(
                  spacing: 8,
                  children: _abilities
                      .map(
                        (a) => FilterChip(
                          label: Text(a),
                          selected: _selectedAbilities.contains(a),
                          onSelected: (on) => setState(() {
                            if (on) {
                              _selectedAbilities.add(a);
                            } else {
                              _selectedAbilities.remove(a);
                            }
                          }),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Equipamento Inicial'),
            isActive: _currentStep >= 5,
            state: _stepState(5),
            content: Column(
              children: _equipment
                  .map(
                    (e) => CheckboxListTile(
                      value: _selectedEquipment.contains(e),
                      onChanged: (on) => setState(() {
                        if (on == true) {
                          _selectedEquipment.add(e);
                        } else {
                          _selectedEquipment.remove(e);
                        }
                      }),
                      title: Text(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _onContinue() {
    if (_currentStep == 0) {
      if (!(_formBasics.currentState?.validate() ?? false)) return;
    }
    if (_currentStep == 1) {
      if (_pointsAvailable < 0) {
        _showSnack('Distribua até o limite de pontos disponíveis.');
        return;
      }
    }
    if (_currentStep == 2 && _origin == null) {
      _showSnack('Selecione uma origem.');
      return;
    }
    if (_currentStep == 3 && _clazz == null) {
      _showSnack('Selecione uma classe.');
      return;
    }

    if (_currentStep < 5) {
      setState(() => _currentStep++);
      return;
    }

    // Finish
    _finish();
  }

  void _onBack() {
    if (_currentStep > 0) setState(() => _currentStep--);
  }

  void _finish() async {
    // Here we could create a Character and persist. For now, just confirm.
    final avatarLine = _avatarUrl != null ? '\nAvatar: \'$_avatarUrl\'' : '';
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Personagem criado!'),
        content: Text(
          'Nome: ${_nameCtrl.text}\nJogador: ${_playerCtrl.text}\nNEX: $_nex%$avatarLine',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    if (mounted) Navigator.pop(context);
  }

  StepState _stepState(int index) {
    if (_currentStep > index) return StepState.complete;
    return StepState.indexed;
  }

  int _pointsFromNex(int nex) {
    // Simple mapping: 5% => 10 pts, 50% => 30 pts, linear-ish
    // Adjust as needed to match system specifics
    final int base = 10;
    final int extra = ((nex - 5) / 5).clamp(0, 9).round() * 2; // +2 per 5% step
    return base + extra;
  }

  Widget _attrRow(String label, int value, ValueChanged<int> onChanged) {
    return Row(
      children: [
        SizedBox(width: 48, child: Text(label)),
        Expanded(
          child: Slider(
            min: 0,
            max: 10,
            divisions: 10,
            label: '$value',
            value: value.toDouble(),
            onChanged: (v) => onChanged(v.round()),
          ),
        ),
        SizedBox(width: 32, child: Text('$value', textAlign: TextAlign.end)),
      ],
    );
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
