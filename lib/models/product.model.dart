import 'package:mba_ecommerce/models/factory.model.dart';

class Product {
  final int id;
  final String name;
  final int amount;
  final double price;
  final Factory factory;

  const Product({
    required this.id,
    required this.name,
    required this.amount,
    required this.price,
    required this.factory
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      amount: json['amount'] as int,
      price: json['price'] as double,
      factory: Factory.fromJson(json['factory']),
    );
  }

  
}