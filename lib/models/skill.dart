class Skill {
  final String name;
  final String attribute; // AGI, INT, VIG, PRE, FOR
  final int bonusDice; // número de dados bônus
  final int training; // valor de treino
  final int others; // outros modificadores

  const Skill({
    required this.name,
    required this.attribute,
    this.bonusDice = 0,
    this.training = 0,
    this.others = 0,
  });
}
