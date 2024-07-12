import 'package:expense_tracker_app/Expense_Lists/newExpense.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:expense_tracker_app/Expense_Lists/expenses_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return ExpensesState();
  }
}

class ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
      title: 'cinema',
      amount: 200,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'flutter couse',
      amount: 599,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _openaddexpenseoverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context /*object of expenses state */,
        builder: (ctx) /*object of showbottomsheet */ {
          return Newexpense(onAddExpense: addNewExpense);
        });
  }

  void addNewExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseindex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registerExpenses.insert(expenseindex,expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(child: Text("Expense list is empty.\nPlease Add new expense",style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold
    ),
    textAlign: TextAlign.center,
    ));

    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onRemoveExpense: removeExpense,
      );
    }
    return Scaffold(
        backgroundColor: Color.fromARGB(95, 0, 0, 0),
        
        
        
        appBar: AppBar(
           backgroundColor: Color.fromARGB(95, 28, 20, 1),
          
          title: const Text(
            "EXPENSE TRACKER",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
                onPressed: _openaddexpenseoverlay, icon: const Icon(Icons.add,color: Colors.white,))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Expanded(child: mainContent),
          ],
        ));
  }
}
