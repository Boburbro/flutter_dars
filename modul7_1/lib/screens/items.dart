import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  static const routeName = '/items';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
        centerTitle: true,
      ),
      body: const Column(
        children: [Text("data")],
      ),
    );
  }
}
