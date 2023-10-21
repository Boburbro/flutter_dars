import 'package:flutter/material.dart';

class OPENLIST extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
              ),
              title: Text("Tarvuz"),
              subtitle: Text("21 October, 2023"),
              trailing: Text("20,000 so'm"),
            );
          },
          itemCount: 10,
        ),
      )
    ]);
  }
}
