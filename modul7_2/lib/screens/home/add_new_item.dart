import 'package:flutter/material.dart';
import 'package:modul7_2/model/category.dart';

class AddNewItem extends StatefulWidget {
  final List<Category> _categories;
  static const routeName = "/add-new-item";
  const AddNewItem(this._categories, {super.key});

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  late String _id;

  TextEditingController _nomi = TextEditingController();
  TextEditingController _tarifi = TextEditingController();
  TextEditingController _tarkibi = TextEditingController();
  TextEditingController _narxi = TextEditingController();
  TextEditingController _vaqti = TextEditingController();

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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save))],
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
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _vaqti,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Ovqat tayyorlanish vaqti(minut)")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
