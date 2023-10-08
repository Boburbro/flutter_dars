import 'dart:ffi';

import 'package:flutter/material.dart';

class BUDGET extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 240, 250, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Oylik buyjet: "),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 16,
                    ),
                    label: Text("1,000,000 so'm"),
                  ),
                ],
              ),
              Text("4.9%")
            ],
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
                color: Color.fromRGBO(212, 219, 239, 1),
                borderRadius: BorderRadius.circular(10)),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              heightFactor: 2,
              widthFactor: 0.5,
              child: Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.blue,
                      Colors.blue.shade200,
                      Colors.blue
                    ],),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        blurRadius: 10,
                        spreadRadius: -9
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
