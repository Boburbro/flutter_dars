import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './models/movies.dart';
import './screens/movie_data.dart';
import './screens/navigatorScreen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _muvies = Movies();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        NavigatorScreen.routeName: (context) =>  NavigatorScreen(_muvies.list),
        MovieData.routeName:(context) => const MovieData(),
      },
    );
  }
}
