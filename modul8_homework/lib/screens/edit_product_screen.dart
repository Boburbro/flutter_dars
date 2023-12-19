import 'package:flutter/material.dart';
import 'package:modul8_homework/model/product.dart';
import 'package:modul8_homework/widgets/edit_product_text_form_field.dart';

// ignore: must_be_immutable
class EditProductScreen extends StatelessWidget {
  final _mainKey = GlobalKey<FormState>();

  EditProductScreen({super.key});

  static const routeName = "/edit-product";

  var _product = Product(
    id: '',
    title: '',
    description: '',
    price: 0,
    imgUrl: '',
  );

  _save() {
    _mainKey.currentState!.save();
    _mainKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _save,
            icon: const Icon(Icons.save_rounded),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _mainKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                EditProductTextFormField(
                  label: const Text("Name"),
                  initialValue: _product.title,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Bu qator bo'sh";
                    } else if (value.length < 4) {
                      return "Kamida 5 ta harf bo'lishi shart";
                    }
                  },
                ),
                const SizedBox(height: 14),
                EditProductTextFormField(
                  label: const Text("Price"),
                  initialValue:
                      _product.price == 0.0 ? "" : _product.price.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bo\'sh bo\'lidhi mumkin emas';
                    } else if (double.tryParse(value) == null) {
                      return 'Raqam ko\'rinishida kiriting';
                    } else if (double.parse(value) <= 0) {
                      return '0 dan katta bolishi kerak!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                EditProductTextFormField(
                  label: const Text("Description"),
                  maxLines: 5,
                  alignLabelWithHint: true,
                  initialValue: _product.description,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Bo\'sh qolmasligi kerak!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                InkWell(
                  splashColor: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    // ... todo
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: const Text(
                      "Asosy rasim url-ni kiriting!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
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
