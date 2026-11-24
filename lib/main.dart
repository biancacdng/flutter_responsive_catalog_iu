import 'package:flutter/material.dart';

class Product {
  const Product ({
    required this.id
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
    required this.description,
  });

  final int id;
  final String name;
  final double price;
  final String category;
  final String imagePath;
  final String description;
}

const List<Product> sampleProducts = [
  Product(
    id: 1,
    name: 'New Balance',
    price: 5,999,
    
  )
]
