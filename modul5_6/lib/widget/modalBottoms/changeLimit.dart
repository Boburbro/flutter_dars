import 'package:flutter/material.dart';
import 'package:modul5_6/widget/adabtive/adabtive_button.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 200 : MediaQuery.of(context).viewInsets.bottom + 50),
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
                ADABTIVE_BUTTON("BEKOR QILISH", (){Navigator.pop(context);}),
                ADABTIVE_BUTTON("SAQLASH", submit, filled: true,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
