import 'package:expenses.dart/models/expense.dart';
import 'package:expenses.dart/widgets/NewExpense.dart';
import 'package:expenses.dart/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _list = [
    Expense(
      title: "Noodle",
      amount: 100,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Car",
      amount: 120.2,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "A book",
      amount: 22.50,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "test",
      amount: 74.23,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(child: ExpensesList(list: _list)),
        ],
      ),
    );
  }
}
