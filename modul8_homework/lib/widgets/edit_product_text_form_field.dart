import 'package:flutter/material.dart';

class EditProductTextFormField extends StatelessWidget {
  const EditProductTextFormField({
    required this.label,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    super.key,
  });

  final Widget label;
  final int maxLines;
  final bool alignLabelWithHint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: label,
        alignLabelWithHint: alignLabelWithHint,
      ),
    );
  }
}
