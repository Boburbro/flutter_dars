import 'package:flutter/material.dart';

class BuildImgSaver extends StatefulWidget {
  final String _title;
  final TextEditingController _controller;
  const BuildImgSaver(this._title, this._controller, {super.key});

  @override
  State<BuildImgSaver> createState() => _BuildImgSaverState();
}

class _BuildImgSaverState extends State<BuildImgSaver> {
  String? _imgUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          // ignore: unnecessary_null_comparison
          child: _imgUrl != null && _imgUrl!.isNotEmpty
              ? Image.network(
                  _imgUrl!,
                  fit: BoxFit.cover,
                  width: 100,
                )
              : const Text("Rasim kiriting!"),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            onSubmitted: (value) {
              if (value.startsWith("http")) {
                setState(() {
                  _imgUrl = value;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Rasim uchun havola kiriting!")),
                );
                setState(() {
                  widget._controller.text = "";
                });
              }
            },
            controller: widget._controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Text(widget._title),
            ),
          ),
        )
      ],
    );
  }
}
