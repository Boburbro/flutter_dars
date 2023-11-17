import 'package:flutter/material.dart';
import 'package:modul7_2/model/category.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/widgets/buildImgSaver.dart';

class AddNewItem extends StatefulWidget {
  final List<Category> _categories;
  final Function _addNewMeal;
  static const routeName = "/add-new-item";
  const AddNewItem(this._categories, this._addNewMeal, {super.key});

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  late String _id;
  final TextEditingController _nomi = TextEditingController();
  final TextEditingController _tarifi = TextEditingController();
  final TextEditingController _tarkibi = TextEditingController();
  final TextEditingController _narxi = TextEditingController();
  final TextEditingController _vaqti = TextEditingController();

  final TextEditingController _mainImg = TextEditingController();
  final TextEditingController _firstImg = TextEditingController();
  final TextEditingController _secondImg = TextEditingController();

  void _save() {
    final String mId = UniqueKey().toString();
    final String cId = _id;

    final String title = _nomi.text;
    final String imgUrl = _mainImg.text;

    final String description = _tarifi.text;

    // ignore: unnecessary_null_comparison
    if (title.isNotEmpty ||
        // ignore: unnecessary_null_comparison
        imgUrl.isNotEmpty ||
        // ignore: unnecessary_null_comparison
        _firstImg.text.isNotEmpty ||
        // ignore: unnecessary_null_comparison
        _secondImg.text.isNotEmpty ||
        // ignore: unnecessary_null_comparison
        _tarkibi.text.isNotEmpty ||
        // ignore: unnecessary_null_comparison
        _vaqti.text.isNotEmpty ||
        // ignore: unnecessary_null_comparison
        _narxi.text.isNotEmpty ||
        // ignore: unnecessary_null_comparison
        description.isNotEmpty) {
      try {
        final List<String> imgUrls = [_firstImg.text, _secondImg.text];
        final List<String> ingredients = _tarkibi.text.split(", ");
        final int preparingTime = int.parse(_vaqti.text);
        final double price = double.parse(_narxi.text);
        setState(() {
          widget._addNewMeal(Meal(
            mId: mId,
            cId: cId,
            title: title,
            imgUrl: imgUrl,
            imgUrls: imgUrls,
            ingredients: ingredients,
            description: description,
            preparingTime: preparingTime,
            price: price,
          ));
        });
        Navigator.of(context).pop(true);
      } catch (d) {
        print("$d");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Hamma malumotlar to'liqmas")));
      }
    } else {
      print("object");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Hamma malumotlar to'liqmas")));
    }
  }

  @override
  void initState() {
    _id = widget._categories[0].cId;
    super.initState();
  }

  void changeId(String cId) {
    setState(() {
      _id = cId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new item"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _save();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              DropdownButton(
                  value: _id,
                  isExpanded: true,
                  items: widget._categories
                      .map((e) => DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(e.title),
                            value: e.cId,
                          ))
                      .toList(),
                  onChanged: (selected) {
                    changeId(selected.toString());
                  }),
              const SizedBox(height: 10),
              TextField(
                controller: _nomi,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Ovqat nomi")),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _tarifi,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Ovqat tarifi")),
                maxLines: 5,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _tarkibi,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Ovqat tarkibi(masalan: go'sht, pomidor...)")),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _narxi,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Ovqat narxi (\$)"),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _vaqti,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Ovqat tayyorlanish vaqti(minut)"),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              BuildImgSaver("Asosy rasim", _mainImg),
              const SizedBox(height: 10),
              BuildImgSaver("1-rasim", _firstImg),
              const SizedBox(height: 10),
              BuildImgSaver("2-rasim", _secondImg),
            ],
          ),
        ),
      ),
    );
  }
}
