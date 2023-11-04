import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextButton(
        onPressed: () {},
        child: const Text("Bosh saxifaga o'tish"),
      )),
      body: const Center(
          child: Text(
        "404 ERROR",
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      )),
    );
  }
}
