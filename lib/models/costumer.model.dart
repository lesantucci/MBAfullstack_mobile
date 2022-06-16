class Costumer {
  final String address;
  final int age;
  final String email;
  final String name;
  final String userPassword;

  const Costumer({
    required this.address,
    required this.age,
    required this.email,
    required this.name,
    required this.userPassword,
  });

  factory Costumer.fromJson(Map<String, dynamic> json) {
    return Costumer(
      address: json['address'],
      age: json['age'],
      email: json['email'],
      name: json['name'],
      userPassword: json['userPassword']
    );
  }
}