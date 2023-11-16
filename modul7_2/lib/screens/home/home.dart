import 'package:flutter/material.dart';
import 'package:modul7_2/model/category.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/screens/home/categories_screen.dart';
import 'package:modul7_2/screens/home/favorite_screen.dart';
import 'package:modul7_2/widgets/drawerMenu.dart';
// import 'package:modul7_2/widgets/categpry_build.dart';

class Home extends StatefulWidget {
  final List<Category> _categoryitems;
  final List<Meal> _meals;

  final List<Meal> _likedMeals;
  final Function changeLiked, isLiked;

  const Home(this._categoryitems, this._meals, this._likedMeals,
      this.changeLiked, this.isLiked,
      {super.key});

  static const routeName = "/";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> _list = [];

  var _screenIndex = 0;

  @override
  void initState() {
    _list = [
      {
        "page": CategoriesScreen(widget._categoryitems, widget._meals),
        "title": "Ovaqtlar menyusi",
      },
      {
        "page": FavoriteScreen(
            widget._likedMeals, widget.changeLiked, widget.isLiked),
        "title": "Sevimli ovqatlar",
      },
    ];

    super.initState();
  }

  void changIndex(var i) {
    setState(() {
      _screenIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_list[_screenIndex]['title']),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: _list[_screenIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        onTap: changIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined), label: "Barchasi"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Sevimli"),
        ],
      ),
    );
  }
}
