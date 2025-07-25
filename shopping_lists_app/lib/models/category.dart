import 'package:flutter/material.dart';
import 'dart:convert';

enum Categories {
  vegetables,
  fruits,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

class Category {
  final String title;
  final Color color;

  const Category(this.title, this.color);

  String colorToJson() {
    return json.encode({
      'alpha': color.a,
      'red': color.r,
      'green': color.g,
      'blue': color.b,
    });
  }

  factory Category.fromJson(String title, Map<String, dynamic> jsonCategoryColor) {
    final color = Color.from(
      alpha: jsonCategoryColor['alpha'] as double,
      red: jsonCategoryColor['red'] as double,
      green: jsonCategoryColor['green'] as double,
      blue: jsonCategoryColor['blue'] as double,
    );

    return Category(title, color);
  }
}
