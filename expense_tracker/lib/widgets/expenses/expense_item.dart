import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // titleLarge will either use default settings or use the one defined in main.dart
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('${expense.price.toStringAsFixed(2)}€'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 5),
                    Text(expense.formattedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}