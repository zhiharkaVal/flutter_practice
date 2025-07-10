import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMMMd();
enum Category { food, travel, leisure, work }
const categoryIcons = {
  Category.food: Icons.fastfood_rounded,
  Category.travel: Icons.flight_takeoff_rounded,
  Category.leisure: Icons.movie_outlined,
  Category.work: Icons.work
};

class Expense {
  final String id;
  final String title;
  final double price;
  final Category category;
  final DateTime purchaseDate;

  Expense({
    required this.title,
    required this.price,
    required this.purchaseDate,
    required this.category
  }) : id = uuid.v4();

  String get formattedDate {
    return dateFormatter.format(purchaseDate);
  }
}