import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work }
const uuid = Uuid();

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
}