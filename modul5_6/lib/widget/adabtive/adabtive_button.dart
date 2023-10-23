import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ADABTIVE_BUTTON extends StatelessWidget {
  final String title;
  final Function submit;
  final bool filled;

  ADABTIVE_BUTTON(this.title, this.submit, {this.filled = false});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? filled
            ? ElevatedButton(
                onPressed: () {
                  submit();
                },
                child: Text(title),
              )
            : TextButton(
                onPressed: () {
                  submit();
                },
                child: Text(title))
        : filled
            ? CupertinoButton.filled(
                child: Text(title),
                onPressed: () {
                  submit();
                })
            : CupertinoButton(
                child: Text(title),
                onPressed: () {
                  submit();
                });
  }
}
