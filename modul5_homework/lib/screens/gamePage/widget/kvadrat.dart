import 'package:flutter/material.dart';

class KVADRAT extends StatelessWidget {
  final String isXorO, rId;
  final Function change, openRestartDialog;
  final bool isGaming;

  KVADRAT(this.rId, this.isXorO, this.change, this.isGaming,
      this.openRestartDialog);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isGaming ? change(rId) : openRestartDialog(),
      child: Container(
        width: 93,
        height: 103,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: isXorO != ' '
            ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  width: 73.15,
                  height: 74,
                  child: isXorO == 'x'
                      ? Image.asset("assets/X.png")
                      : Image.asset("assets/o.png"),
                ),
            )
            : Container(),
      ),
    );
  }
}
