import 'package:flutter/material.dart';

class RACTANGLE extends StatelessWidget {
  final String _title;
  final int _index;
  final Function chandeIndex;

  RACTANGLE(this._title, this._index, this.chandeIndex);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        chandeIndex(_index);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            _title == '16' ? " " : _title,
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
