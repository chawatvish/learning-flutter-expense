import 'package:expenses.dart/models/expense.dart';
import 'package:expenses.dart/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> list;

  const ExpensesList({
    super.key,
    required this.list,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        key: ValueKey(list[index]),
        onDismissed: (direction) {
          onRemoveExpense(list[index]);
        },
        child: ExpensesItem(
          expense: list[index],
        ),
      ),
    );
  }
}
