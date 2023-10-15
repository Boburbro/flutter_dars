import 'package:flutter/material.dart';

class EDITMONTHLYBUDGET extends StatefulWidget {
  final Function changeLimit;
  final double budgetLimit;

  EDITMONTHLYBUDGET(this.changeLimit, this.budgetLimit);

  @override
  State<EDITMONTHLYBUDGET> createState() => _EDITMONTHLYBUDGETState();
}

class _EDITMONTHLYBUDGETState extends State<EDITMONTHLYBUDGET> {
  final b_a_c = TextEditingController();

  void submit() {
    double aaa = double.parse(b_a_c.text);
    if (b_a_c.text.isEmpty) {
      return;
    } else if (aaa <= 0) {
      return;
    } else {
      setState(() {
        widget.changeLimit(double.parse(b_a_c.text));
      });
      Navigator.of(context).pop();
    }
    // Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    b_a_c.text = widget.budgetLimit.toStringAsFixed(0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    b_a_c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: b_a_c,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Oylik budget miqdori",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("BEKOR QILISH"),
              ),
              ElevatedButton(
                onPressed: () {
                  submit();
                },
                child: const Text("SAQLASH"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
