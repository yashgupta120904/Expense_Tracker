import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  travel,
  work,
  leisure
} /*enum is keyword for custom inisilization
and it store object ,objects work as string */

const catgoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  get dateformatted {
    return formatter.format(date);
  }
}
