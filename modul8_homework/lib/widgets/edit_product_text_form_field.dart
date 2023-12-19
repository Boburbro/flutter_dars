import 'package:flutter/material.dart';

class EditProductTextFormField extends StatelessWidget {
  const EditProductTextFormField({
    required this.label,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.initialValue = "",
    this.textInputAction,
    this.onSaved,
    this.validator,
    this.keyboardType,
    Key? key,
  }) : super(key: key);

  final Widget label;
  final int maxLines;
  final bool alignLabelWithHint;
  final String initialValue;
  final TextInputAction? textInputAction;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: label,
        alignLabelWithHint: alignLabelWithHint,
      ),
      textInputAction: textInputAction,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
