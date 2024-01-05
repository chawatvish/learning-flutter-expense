import 'package:expenses.dart/models/expense.dart';
import 'package:expenses.dart/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> list;

  const ExpensesList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => ExpensesItem(expense: list[index]),
    );
  }
}
