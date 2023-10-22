import 'package:flutter/material.dart';

class ITEMLISTBUILD extends StatelessWidget {
  final String rID, title, date, amount;
  final IconData icon;
  final Function removeItem;
  final Key key;

  ITEMLISTBUILD(this.rID, this.title, this.date, this.amount, this.icon, this.removeItem, this.key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        removeItem(rID);
      },
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete_forever),
        color: Colors.red,
      ),
      key: key,
      child: ListTile(
        leading: Container(
          width:  40,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 234, 228),
            borderRadius: BorderRadius.circular(50)
          ),
          child: Icon(icon),
        ),  //,
        title: Text(title),
        subtitle: Text("${date}"),
        trailing: Text("$amount so'm"),
      ),
    );
  }
}
