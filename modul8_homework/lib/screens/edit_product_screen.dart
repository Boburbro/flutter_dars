import 'package:flutter/material.dart';
import 'package:modul8_homework/widgets/edit_product_text_form_field.dart';

class EditProductScreen extends StatelessWidget {
  final _mainKey = GlobalKey<FormState>();

  EditProductScreen({super.key});

  static const routeName = "/edit-product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_rounded),
          ),
        ],
      ),
      body: Form(
        key: _mainKey,
        child: const SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              EditProductTextFormField(label: Text("Name")),
              const SizedBox(height: 14),
              EditProductTextFormField(label: Text("Price")),
              const SizedBox(height: 14),
              EditProductTextFormField(
                label: Text("Description"),
                maxLines: 5,
                alignLabelWithHint: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
