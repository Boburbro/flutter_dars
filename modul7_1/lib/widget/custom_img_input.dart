import 'package:flutter/material.dart';

class CustomImgUrl extends StatefulWidget {
  final String _label;
  final TextEditingController _controller;

  CustomImgUrl(this._label, this._controller, {super.key});

  @override
  State<CustomImgUrl> createState() => _CustomImgUrlState();
}

class _CustomImgUrlState extends State<CustomImgUrl> {
  var imgUrl;

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
          child: imgUrl != null
              ? Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                )
              : const Text("Rasim kiriting!"),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: widget._controller,
            decoration: InputDecoration(labelText: widget._label),
            onSubmitted: (value) {
              setState(() {
                imgUrl = value;
              });
            },
          ),
        )
      ],
    );
  }
}
