import 'package:flutter/material.dart';

class ITEMLISTS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height - 400,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 5
        ),
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.amber),
            title: Text("Kitob", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("1 Ocrober, 2023", style: TextStyle(fontSize: 13),),
            trailing: Text("20,000 so'm"),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
