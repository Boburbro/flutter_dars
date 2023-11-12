import 'package:flutter/material.dart';
import 'package:modul7_1/models/category.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/widget/custom_img_input.dart';

class AddNewItem extends StatefulWidget {
  final List<Category> _categories;
  final Function _addNewMeal;

  AddNewItem(this._categories, this._addNewMeal, {super.key});
  static const routeName = "add-new-item";

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  late String _id;
  final _itemNameController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  final _itemIngredientasController = TextEditingController();
  final _itemPriceController = TextEditingController();
  final _itemPreparingTimeController = TextEditingController();
  final _mainImgUrlController = TextEditingController();
  final _firstImgUrlController = TextEditingController();
  final _secondImgUrlController = TextEditingController();
  final _thirdImgUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _id = widget._categories[0].id;
  }

  void _save() {
    final title = _itemNameController.text;
    final des = _itemDescriptionController.text;
    final ingred = _itemIngredientasController.text;
    final price = _itemPriceController.text;
    final prepar = _itemPreparingTimeController.text;
    final mainImg = _mainImgUrlController.text;
    final firstImg = _firstImgUrlController.text;
    final secondImg = _secondImgUrlController.text;
    final thirdImg = _thirdImgUrlController.text;

    if (title.isEmpty ||
        des.isEmpty ||
        ingred.isEmpty ||
        price.isEmpty ||
        prepar.isEmpty ||
        mainImg.isEmpty ||
        firstImg.isEmpty ||
        secondImg.isEmpty ||
        thirdImg.isEmpty) {
      return;
    } else {
      print("object 3");
      List<String> imgUrls = [firstImg, secondImg, thirdImg];
      List<String> ingredList = ingred.split(", ");
      widget._addNewMeal(Meal(
          mId: UniqueKey().toString(),
          title: title,
          imgUrl: mainImg,
          imgUrls: imgUrls,
          ingredients: ingredList,
          description: des,
          preparingTime: int.parse(prepar),
          price: double.parse(price),
          categoryId: _id));
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yangi ovqat"),
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
                  isExpanded: true,
                  value: _id,
                  items: widget._categories
                      .map((e) => DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(e.title),
                            value: e.id,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _id = value as String;
                    });
                  }),
              TextField(
                controller: _itemNameController,
                decoration: const InputDecoration(labelText: "Ovqat nomi"),
              ),
              TextField(
                controller: _itemDescriptionController,
                decoration: const InputDecoration(labelText: "Ovqat tarifi"),
                maxLines: 5,
              ),
              TextField(
                controller: _itemIngredientasController,
                decoration: const InputDecoration(
                    labelText: "Ovqat tarkibi (masalan: go'sht, pomidor ...)"),
              ),
              TextField(
                controller: _itemPriceController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: "Ovqat narxi (\$)"),
              ),
              TextField(
                controller: _itemPreparingTimeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Ovqat tayyorlanish vaqti (minut)"),
              ),
              const SizedBox(height: 10),
              // ignore: prefer_is_empty
              CustomImgUrl('Asosiy rasimni kiriting', _mainImgUrlController),
              const SizedBox(height: 10),
              CustomImgUrl('1-rasimni kiriting', _firstImgUrlController),
              const SizedBox(height: 10),
              CustomImgUrl('2-rasimni kiriting', _secondImgUrlController),
              const SizedBox(height: 10),
              CustomImgUrl('3-rasimni kiriting', _thirdImgUrlController),
            ],
          ),
        ),
      ),
    );
  }
}
