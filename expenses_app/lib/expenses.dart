import 'package:expenses_app/widgets/chart/chart.dart';
import 'package:expenses_app/widgets/expenses_list.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense('Papas de la veci', 4.5, DateTime.now(), Category.food),
    Expense('Bielas', 12.5, DateTime.now(), Category.leisure),
    Expense('Foco de oficina', 24.35, DateTime.now(), Category.work),
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: _addNewExpense,
          );
        });
  }

  void _addNewExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expenseToRemove) {
    final expenseIndex = _registeredExpenses.indexOf(expenseToRemove);

    setState(() {
      _registeredExpenses.remove(expenseToRemove);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text('EXPENSE DELETED'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expenseToRemove);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text('NO HAY GASTOS, POBREEE'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MONITOREO DE GASTOS'),
        actions: [
          IconButton(
              onPressed: _openAddExpensesOverlay, icon: Icon(Icons.add_box)),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
