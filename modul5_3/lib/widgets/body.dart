import 'package:flutter/material.dart';
import 'package:modul5_3/widgets/itemLists.dart';
import 'package:modul5_3/widgets/month.dart';

class BODY extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: MONTH(),
            decoration: BoxDecoration(
                color: Color.fromRGBO(239, 240, 250, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
          ),
          Positioned(
            bottom: 0,
            child: ITEMLISTS(),
          )
        ],
      ),
    );
  }
}
