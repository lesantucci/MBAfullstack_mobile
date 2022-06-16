class Factory {
  final int id;
  final String name;

  const Factory({
    required this.id,
    required this.name
  });

  factory Factory.fromJson(Map<String, dynamic> json) {
    return Factory(id: json['id'] as int, name: json['name'] as String);
  }
}