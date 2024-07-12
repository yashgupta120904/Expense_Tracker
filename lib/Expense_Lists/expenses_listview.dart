import 'package:expense_tracker_app/Expense_Lists/expense_item.dart';
import 'package:expense_tracker_app/model/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            key: ValueKey(
              expenses[index],
            ),
            background: Container(color: Colors.red,
            child:const Padding(
              padding:  EdgeInsets.only(left: 200),
              child:  Icon(Icons.delete,color: Colors.white,size: 30,),
            ),),
            child: Expense_item(
              expense: expenses[index],
            ),
          );
        });
  }
}
