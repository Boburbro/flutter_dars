import 'package:flutter/material.dart';

class CHANGELIMIT extends StatefulWidget {
  final Function changeLimit;
  final double budgetLimit;

  CHANGELIMIT(this.changeLimit, this.budgetLimit);

  @override
  State<CHANGELIMIT> createState() => _CHANGELIMITState();
}

class _CHANGELIMITState extends State<CHANGELIMIT> {
  TextEditingController amount = TextEditingController();

  void submit(BuildContext context) {
    double aaa = double.parse(amount.text);
    if (amount.text.isEmpty) {
      return;
    } else if (aaa <= 0) {
      return;
    }
    widget.changeLimit(aaa);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    amount.text = widget.budgetLimit.toStringAsFixed(0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: amount,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Yangi Limitni kiriting!",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("BEKOR QILISH"),
              ),
              ElevatedButton(
                onPressed: () {
                  submit(context);
                },
                child: Text("SAQLASH"),
              )
            ],
          )
        ],
      ),
    );
  }
}
