import 'package:flutter/material.dart';

class BuildScreensMenu extends StatelessWidget {
  final IconData _iconData;
  final String _title;
  final Function _onTap;
  const BuildScreensMenu(this._iconData, this._title, this._onTap, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          _onTap();
        },
        leading: Icon(_iconData),
        title: Text(_title),
      ),
    );
  }
}
