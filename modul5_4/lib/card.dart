import 'dart:math';

import 'package:flutter/material.dart';

class CARDINIT extends StatefulWidget {
  final String ism;
  final Function deletee;

  CARDINIT(this.ism, this.deletee, {Key? key}) : super(key: key);

  @override
  State<CARDINIT> createState() => _CARDINITState();
}

class _CARDINITState extends State<CARDINIT> {
  Color? bgColor;

  @override
  void initState() {
    final colors = [
      Colors.black,
      Colors.red,
      Colors.orange,
      Colors.grey,
      Colors.green,
    ];

    // ignore: unused_local_variable
    bgColor = colors[Random().nextInt(colors.length)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.ism);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: bgColor,
        ),
        title: Text("${widget.ism}"),
        subtitle: Text("Bu ${widget.ism}"),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever, color: Colors.red),
          onPressed: () {
            widget.deletee(widget.ism);
          },
        ),
      ),
    );
  }
}
