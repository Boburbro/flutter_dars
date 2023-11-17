import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul7_homework/screens/navigatorScreen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        NavigatorScreen.routeName: (context) => const NavigatorScreen(),
      },
    );
  }
}
