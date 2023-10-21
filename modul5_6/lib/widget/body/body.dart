import 'package:flutter/material.dart';
import 'package:modul5_6/widget/body/budger.dart';
import 'package:modul5_6/widget/body/openlist.dart';

class BODY extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 10,
              right: 24,
              left: 24,
              bottom: 10,
            ),
            child: BUDGET(),
            decoration: BoxDecoration(
                color: Color.fromRGBO(239, 240, 250, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: MediaQuery.of(context).size.height - 290,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                  color: Colors.white),
              child: OPENLIST(),
            ),
          )
        ],
      ),
    );
  }
}
