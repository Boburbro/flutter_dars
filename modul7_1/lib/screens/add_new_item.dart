import 'package:flutter/material.dart';
import 'package:modul7_1/models/category.dart';
import 'package:modul7_1/widget/custom_img_input.dart';

class AddNewItem extends StatefulWidget {
  final List<Category> _categories;

  AddNewItem(this._categories, {super.key});
  static const routeName = "add-new-item";

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  late String _id;
  List<String> _imgUrls = [];
  TextEditingController _mainimgUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _id = widget._categories[0].id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yangi ovqat"),
        centerTitle: true,
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
                            child: Text(e.title),
                            value: e.id,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _id = value as String;
                    });
                  }),
              const TextField(
                decoration: InputDecoration(labelText: "Ovqat nomi"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Ovqat tarifi"),
                maxLines: 5,
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Ovqat tarkibi (masalan: go'sht, pomidor ...)"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Ovqat narxi (\$)"),
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: "Ovqat tayyorlanish vaqti (minut)"),
              ),
              const SizedBox(height: 10),
              CustomImgUrl(_imgUrls.length > 0 ? _imgUrls[0] : '',
                  'Asosiy rasimni urlini kiriting', _mainimgUrlController)
            ],
          ),
        ),
      ),
    );
  }
}
