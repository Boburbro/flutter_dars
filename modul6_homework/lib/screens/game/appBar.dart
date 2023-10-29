import 'package:flutter/material.dart';

class APPBAR extends StatelessWidget {
  final Widget _icons;

  APPBAR(this._icons);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: _icons,
    );
  }
}
