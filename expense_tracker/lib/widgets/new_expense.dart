import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;
  const NewExpense({super.key, required this.onAddExpense});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  Category _selectedCategory = Category.food;
  DateTime? _selectedDate;

  void _showDatePicker () async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showIOsDialog  () {
    // cupertino IOs native widgets
    showCupertinoDialog(
      context: context,
      builder: (ctx) =>
        AlertDialog(
          title: const Text('Invalid expense data'),
          content: const Text(
            'Please, make sure that a valid title, price and data was entered'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
    );
  }

  void _showDefaultDialog () {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid expense data'),
        content: const Text('Please, make sure that a valid title, price and data was entered'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Okay'),
          )
        ],
      ),
    );
  }

  void _submitExpenseData() {
    final enteredPrice = double.tryParse(_priceController.text);
    final invalidEnteredPrice = (enteredPrice == null) || (enteredPrice <= 0);

    if (_titleController.text.trim().isEmpty || invalidEnteredPrice || _selectedDate == null) {
      (Platform.isIOS) ? _showIOsDialog() : _showDefaultDialog ();
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text.toString(),
        price: enteredPrice,
        purchaseDate: _selectedDate!,
        category: _selectedCategory)
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox (
        height: double.infinity,
        child:SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, keyboardSpace + 15),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Title')
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: TextField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '€',
                            label: Text('Price')
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Title')
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                        value: _selectedCategory,
                        items: Category.values.map((category) =>
                          DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toString().toUpperCase()),
                          ),
                        ).toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate == null ? 'No date selected' : dateFormatter.format(_selectedDate!)),
                            IconButton(
                              onPressed: _showDatePicker,
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ]
                        ),
                      ),
                    ]
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '€',
                            label: Text('Price')
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Expanded(
                        child: Row(
                          mainAxisAlignment:  MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate == null ? 'No date selected' : dateFormatter.format(_selectedDate!)),
                            IconButton(
                              onPressed: _showDatePicker,
                              icon: const Icon(Icons.calendar_month),
                            ),
                          ]
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 15),
                  if (width >= 600)
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel')
                        ),
                        ElevatedButton(
                          onPressed: _submitExpenseData,
                          child: const Text('Save')
                        ),
                    ],
                  )
                  else
                    Row(
                      children: [
                        DropdownButton(
                          value: _selectedCategory,
                          items: Category.values.map((category) =>
                              DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toString().toUpperCase()),
                              ),
                          ).toList(),
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')
                        ),
                        ElevatedButton(
                            onPressed: _submitExpenseData,
                            child: const Text('Save')
                        ),
                      ],
                    )
              ],
            ),
          ),
        ),
      );
    });

  }
}