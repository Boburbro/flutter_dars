import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChANGELIMIT extends StatelessWidget {
  final Function changLimit1;
  TextEditingController newlimitA = TextEditingController();
  ChANGELIMIT(this.changLimit1);

  void submit() {
    if (newlimitA.text.isEmpty) {
      return;
    } else {
      changLimit1(int.parse(newlimitA.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: 24,
          left: 24,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom + 50 : MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: newlimitA,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Yangi limitni kiriting"),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Bekor qilish",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      submit();
                      Navigator.of(context).pop();
                    },
                    child: Text("Saqlash"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
