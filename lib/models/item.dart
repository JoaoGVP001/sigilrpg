class Item {
  final String id;
  final String name;
  final String category; // armas, equipamento, consumível, etc.
  final double weight;
  final String? description;

  const Item({
    required this.id,
    required this.name,
    required this.category,
    this.weight = 0,
    this.description,
  });
}
