import 'package:flutter/material.dart';

class CustomImgUrl extends StatelessWidget {
  final String _imgUrl;
  final String _label;
  final TextEditingController _controller;

  const CustomImgUrl(this._imgUrl, this._label, this._controller, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          // ignore: unnecessary_null_comparison
          child: _imgUrl.isNotEmpty && _imgUrl != null
              ? Image.network(_imgUrl)
              : const Text("Rasim kiriting!"),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: _label),
          ),
        )
      ],
    );
  }
}
