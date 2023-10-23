import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ADABTIVE_TEXT_FILD extends StatelessWidget {
  final String label;
  final TextEditingController nomi;
  final TextInputType? keyBoardType;

  ADABTIVE_TEXT_FILD(this.label, this.nomi, this.keyBoardType);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            placeholder: label,
            controller: nomi,
            padding: EdgeInsets.all(10),
            keyboardType: keyBoardType ?? TextInputType.text,
          )
        : TextField(
            controller: nomi,
            decoration: InputDecoration(
                labelText: "Xarajat nomi", border: OutlineInputBorder()),
            keyboardType: keyBoardType ?? TextInputType.text,
          );
  }
}
