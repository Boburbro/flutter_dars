import 'package:flutter/material.dart';
import 'package:modul5_5/models/expense.dart';
import 'package:modul5_5/widgets/expens_list_title.dart';

class ITEMLISTS extends StatelessWidget {
  final List<Expense> items;

  ITEMLISTS(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height - 280,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: items.length == 0
          ? Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Column(
                  children: [
                    Text("Siz daxosiz sizda xarajat yo'q", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 10,),
                    Image.asset("assets/profit.png", fit: BoxFit.cover, width: 300,)
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 5),
              itemBuilder: (ctx, index) {
                return EELISTTITLE(items[index].title, items[index].date, items[index].amount);
              },
              itemCount: items.length,
            ),
    );
  }
}
