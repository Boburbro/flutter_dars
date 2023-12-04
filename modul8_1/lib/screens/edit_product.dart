import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  static const routeName = "/edit-product";

  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  // final _priceFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Product")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Price"),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Description"),
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(5),
                    splashColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                    highlightColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      width: double.infinity,
                      height: 100,
                      alignment: Alignment.center,
                      child: const Text("Asosy rasim URl-ni kiriting"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
