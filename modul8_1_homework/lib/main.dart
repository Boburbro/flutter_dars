import 'package:flutter/material.dart';

import './style/them.dart';

import './screens/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThem.theme,
      initialRoute: "/",
      routes: {
        Home.routeName: (context) => const Home(),
      },
    );
  }
}
