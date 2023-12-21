import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowInputImgSheet extends StatelessWidget {
  ShowInputImgSheet(
      {required this.imgURLkey, required this.imgURLSaver, super.key});

  final GlobalKey<FormState> imgURLkey;
  final Function imgURLSaver;
  bool _hasImage = false;

  void _save(BuildContext context) {
    _hasImage = imgURLkey.currentState!.validate();
    if (_hasImage) {
      imgURLkey.currentState!.save();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Form(
        key: imgURLkey,
        child: TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Rasim URL"),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "URL kiriting!";
            } else if (!value.startsWith("http")) {
              return "URL link bu'lishi shart!";
            }
            return null;
          },
          onSaved: (newValue) {
            if (_hasImage) {
              imgURLSaver(newValue);
            }
          },
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("BEKOR QILISH")),
        ElevatedButton(
            onPressed: () => _save(context), child: const Text("SAQLASH")),
      ],
    );
  }
}
