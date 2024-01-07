import 'package:expenses.dart/models/expense.dart';
import 'package:expenses.dart/widgets/chart/chart.dart';
import 'package:expenses.dart/widgets/expenses_list/expenses_list.dart';
import 'package:expenses.dart/widgets/new_expense.dart';
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
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _list.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    int expenseIndex = _list.indexOf(expense);
    setState(() {
      _list.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense removed"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _list.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent;
    if (_list.isEmpty) {
      mainContent = const Center(
        child: Text("No expenses added yet!"),
      );
    } else {
      mainContent = ExpensesList(
        list: _list,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: width < 600
            ? Column(
                children: [
                  Chart(expenses: _list),
                  Expanded(child: mainContent),
                ],
              )
            : Row(
                children: [
                  Expanded(child: Chart(expenses: _list)),
                  Expanded(child: mainContent),
                ],
              ),
      ),
    );
  }
}
