import 'package:flutter/material.dart';
import 'package:modul8_homework/model/product.dart';
import 'package:modul8_homework/providers/product_provider.dart';
import 'package:modul8_homework/widgets/edit_product_text_form_field.dart';
import 'package:modul8_homework/widgets/show_input_img_sheet.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  static const routeName = "/edit-product";

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _mainKey = GlobalKey<FormState>();
  final _imgURLkey = GlobalKey<FormState>();

  bool _hasImg = true;
  bool _init = true;

  var _product =
      Product(id: '', title: '', description: '', price: 0, imgUrl: '');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      final data = ModalRoute.of(context)!.settings.arguments;
      if (data != null) {
        // ignore: no_leading_underscores_for_local_identifiers
        final _editingProduct =
            Provider.of<ProductProvider>(context).findById(data as String);
        _product = _editingProduct;
      }
    }
    _init = false;
  }

  _save() {
    bool isSuccessful = _mainKey.currentState!.validate();
    setState(() {
      _hasImg = _product.imgUrl.isNotEmpty;
    });

    if (isSuccessful && _hasImg) {
      _mainKey.currentState!.save();
      if (_product.id.isEmpty) {
        Provider.of<ProductProvider>(context, listen: false)
            .addNewProduct(_product);
      } else {
        Provider.of<ProductProvider>(context, listen: false)
            .editProduct(_product);
      }

      Navigator.of(context).pop();
    }
  }

  void saveImg(String img) {
    setState(
      () {
        _product = Product(
          id: _product.id,
          title: _product.title,
          description: _product.description,
          price: _product.price,
          imgUrl: img,
        );
        _hasImg = _product.imgUrl.isNotEmpty;
      },
    );
  }

  void openShowInputImgSheet(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return ShowInputImgSheet(
          imgURLkey: _imgURLkey,
          imgURLSaver: saveImg,
        );
      },
    );
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
                  onSaved: (value) {
                    _product = Product(
                      id: _product.id,
                      title: value!,
                      description: _product.description,
                      price: _product.price,
                      imgUrl: _product.imgUrl,
                    );
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Bu qator bo'sh";
                    } else if (value.length < 4) {
                      return "Kamida 5 ta harf bo'lishi shart";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                EditProductTextFormField(
                  label: const Text("Price"),
                  initialValue:
                      _product.price == 0.0 ? "" : _product.price.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _product = Product(
                      id: _product.id,
                      title: _product.title,
                      description: _product.description,
                      price: double.parse(value!),
                      imgUrl: _product.imgUrl,
                    );
                  },
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
                  onSaved: (value) {
                    _product = Product(
                      id: _product.id,
                      title: _product.title,
                      description: value!,
                      price: _product.price,
                      imgUrl: _product.imgUrl,
                    );
                  },
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
                  onTap: () => openShowInputImgSheet(context),
                  child: Container(
                    alignment: Alignment.center,
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: _hasImg ? Colors.black45 : Colors.red,
                      ),
                    ),
                    child: _product.imgUrl.isEmpty
                        ? Text(
                            "Asosy rasim url-ni kiriting!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _hasImg ? Colors.black : Colors.red,
                            ),
                          )
                        : Image.network(
                            _product.imgUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
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
