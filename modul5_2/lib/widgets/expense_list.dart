import 'package:flutter/material.dart';

class EXPENSELIST extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
      ),
    );
  }
}
