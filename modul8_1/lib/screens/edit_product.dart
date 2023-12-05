import 'package:flutter/material.dart';
import 'package:modul8_1/models/product.dart';

class EditProduct extends StatefulWidget {
  static const routeName = "/edit-product";

  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _form = GlobalKey<FormState>();
  final _formImg = GlobalKey<FormState>();

  var _product = Product(
    id: '',
    title: '',
    price: 0.0,
    des: '',
    imgUrl: "",
  );

  void _openInputImgeUrl(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Form(
            key: _formImg,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Rasim URL'),
              keyboardType: TextInputType.url,
              onSaved: (newValeu) {
                print("object");
                _product = Product(
                  id: '',
                  title: _product.title,
                  price: _product.price,
                  des: _product.des,
                  imgUrl: newValeu!,
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Bekor qilish"),
            ),
            ElevatedButton(
              onPressed: () {
                _saveImg(context);
              },
              child: const Text("Saqlash"),
            ),
          ],
        );
      },
    );
  }

  void _saveForm() {
    print(_product.title);
    print(_product.des);
    print(_product.price);
    print(_product.imgUrl);
    _form.currentState!.save();
  }

  void _saveImg(BuildContext context) {
    print(_product.imgUrl);
    _formImg.currentState!.save();
    setState(() {});
    Navigator.of(context).pop();
  }

  // final _priceFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save_rounded),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (newValeu) {
                    _product = Product(
                      id: '',
                      title: newValeu!,
                      price: _product.price,
                      des: _product.des,
                      imgUrl: _product.imgUrl,
                    );
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Price"),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    onSaved: (newValeu) {
                      _product = Product(
                        id: '',
                        title: _product.title,
                        price: double.parse(newValeu!),
                        des: _product.des,
                        imgUrl: _product.imgUrl,
                      );
                    }),
                const SizedBox(height: 15),
                TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Description"),
                      alignLabelWithHint: true,
                    ),
                    onSaved: (newValeu) {
                      _product = Product(
                        id: '',
                        title: _product.title,
                        price: _product.price,
                        des: newValeu!,
                        imgUrl: _product.imgUrl,
                      );
                    }),
                const SizedBox(height: 15),
                Card(
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    onTap: () => _openInputImgeUrl(context),
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
                      height: 200,
                      alignment: Alignment.center,
                      child: _product.imgUrl.isEmpty
                          ? const Text("Asosy rasim URl-ni kiriting")
                          : Image.network(
                              _product.imgUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
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
