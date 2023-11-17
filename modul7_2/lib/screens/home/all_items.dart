import 'package:flutter/material.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/screens/home/add_new_item.dart';
import 'package:modul7_2/widgets/drawerMenu.dart';

class AllItems extends StatefulWidget {
  final List<Meal> _meals;
  final Function removeItem;

  static const routeName = "/all-items";

  const AllItems(this._meals, this.removeItem, {super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  void remove(String mId) {
    widget.removeItem(mId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Items"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AddNewItem.routeName)
                    .then((value) {
                  if (value == true) {
                    setState(() {});
                  }
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: widget._meals.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      widget._meals[index].imgUrl.startsWith("assets/")
                          ? AssetImage(widget._meals[index].imgUrl)
                          : NetworkImage(widget._meals[index].imgUrl)
                              as ImageProvider,
                ),
                // ignore: unnecessary_string_interpolations
                title: Text(widget._meals[index].title),
                subtitle: Text("\$${widget._meals[index].price}"),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_forever_sharp,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    remove(widget._meals[index].mId);
                  },
                ),
              ),
            );
          }),
      drawer: const DrawerMenu(),
    );
  }
}
