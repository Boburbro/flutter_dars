import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Expense({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.icon = Icons.ac_unit,
  });
}

class Expenses {
  List<Expense> _item = [
    Expense(id: "r1", title: "Tarvuz", date: DateTime.now(), amount: 20000),
    Expense(id: "r2", title: "Krasofka", date: DateTime.now(), amount: 290000),
    Expense(id: "r3", title: "Dars", date: DateTime.now(), amount: 2000000),
    Expense(id: "r4", title: "Kino", date: DateTime.now(), amount: 200000),
  ];
  List<Expense> get items {
    return _item;
  }

  void addNewExpenses(String title, DateTime date, double amount){
    _item.add(Expense(id: "r${_item.length+1}", title: title, date: date, amount: amount));
  }

  List<Expense> itemsByMonth(DateTime date){
    return _item.where((element) =>  element.date.month == date.month && element.date.year == date.year).toList();
  }

  double totalItems(DateTime date){
    final _itemsByMonth = itemsByMonth(date);

    return _itemsByMonth.fold(0, (previousValue, element){
      return previousValue + element.amount;
    });
  }

}
