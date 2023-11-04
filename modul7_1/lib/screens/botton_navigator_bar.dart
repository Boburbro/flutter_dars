import 'package:flutter/material.dart';
import 'package:modul7_1/models/category.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/screens/categories_screen.dart';
import 'package:modul7_1/screens/favorites_screen.dart';

class BottanNavigatoBarScreen extends StatefulWidget {
  // ignore: unused_field
  final List<Category> _categories;
  // ignore: unused_field
  final List<Meal> _meals;
  const BottanNavigatoBarScreen(this._categories, this._meals, {super.key});
  @override
  State<BottanNavigatoBarScreen> createState() =>
      _BottanNavigatoBarScreenState();
}

class _BottanNavigatoBarScreenState extends State<BottanNavigatoBarScreen> {
  List<Map<String, dynamic>> _list = [];

  var _tapIndex = 0;
  @override
  void initState() {
    _list = [
      {
        "page": CategoriesScreen(widget._categories, widget._meals),
        "title": "Ovaqtlar menyusi",
      },
      {
        "page": const FavoritesScreen(),
        "title": "Sevimli ovqatlar",
      },
      //
    ];

    // TODO: implement initState
    super.initState();
  }

  void _changeTap(int i) {
    setState(() {
      _tapIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_list[_tapIndex]["title"]),
      ),
      body: _list[_tapIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white.withOpacity(0.8),
          currentIndex: _tapIndex,
          onTap: _changeTap,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz_outlined), label: "Barchasi"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Sevimli"),
          ]),
    );
  }
}
