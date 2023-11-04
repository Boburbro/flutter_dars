import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  static const routeName = "/not-found-page";

  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextButton.icon(
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
        label: const Text("Bosh saxifaga o'tish"),
        icon: const Icon(Icons.home),
      )),
      body: const Center(
          child: Text(
        "404 ERROR",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      )),
    );
  }
}
