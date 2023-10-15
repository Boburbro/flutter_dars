import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EELISTTITLE extends StatelessWidget {
  final String titleE;
  final DateTime dateE;
  final double amount;
  EELISTTITLE(this.titleE, this.dateE, this.amount);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
      ),
      title: Text(
        titleE,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "${DateFormat('dd MMMM, yyy').format(dateE)}",
        style: TextStyle(fontSize: 13),
      ),
      trailing: Text("$amount so'm"),
    );
  }
}
