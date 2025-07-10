import 'package:expense_tracker/widgets/expenses/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
      title: "Tomatoes",
      price: 0.99,
      purchaseDate: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Swimming pool",
      price: 4.99,
      purchaseDate: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Welcome to Expense Tracker!"),
          Expanded(
            child: ExpensesList(expenses: _expenses),
          ),
        ],
      ),
    );
  }
}
