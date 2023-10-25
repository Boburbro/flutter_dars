import 'package:flutter/material.dart';

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('showDialog Sample')),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            _dialogBuilder(context);
          },
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }

  void _dialogBuilder(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('tle'),
          content: Text('dee'),
        );
      },
    );
  }
}
