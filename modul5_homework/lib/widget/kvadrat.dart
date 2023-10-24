import 'package:flutter/material.dart';

class KVADRAT extends StatefulWidget {
  final String isXorO, rId;
  final Function change;
  KVADRAT(this.rId, this.isXorO, this.change);
  @override
  State<KVADRAT> createState() => _KVADRATState();
}

class _KVADRATState extends State<KVADRAT> {

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.change(widget.rId);
      },
      child: Container(
        width: 93,
        height: 103,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget.isXorO != '' ? Container(
          width: 73.15,
          height: 74,
          child: true ? Image.asset("assets/X.png") : Image.asset("assets/o.png"),
        ) : Container(),
      ),
    );
  }
}
