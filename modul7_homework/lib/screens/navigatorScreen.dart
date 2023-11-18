import 'package:flutter/material.dart';
import 'package:modul7_homework/models/movies.dart';
import 'package:modul7_homework/screens/categories.dart';
import 'package:modul7_homework/screens/home.dart';

class NavigatorScreen extends StatefulWidget {
  final List<Movie> _movies;
  const NavigatorScreen(this._movies, {super.key});
  static const routeName = '/';

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _selectedItem = 0;

  void changeSelectedItem(int n) {
    setState(() {
      _selectedItem = n;
    });
  }

  List _list = [];

  @override
  void initState() {
    _list.add(Home(widget._movies));
    _list.add(CategoriesM(widget._movies));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15141F),
      body: SafeArea(
        child: _list[_selectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF15141F),
        selectedItemColor: const Color(0xFFF75F47),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (n) {
          changeSelectedItem(n);
        },
        currentIndex: _selectedItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow_rounded),
            label: " ",
          ),
        ],
      ),
    );
  }
}
