import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ADDNEWCHACK extends StatefulWidget {
  final Function getDataForAdd;

  ADDNEWCHACK({required this.getDataForAdd});

  @override
  State<ADDNEWCHACK> createState() => _ADDNEWCHACKState();
}

class _ADDNEWCHACKState extends State<ADDNEWCHACK> {
  DateTime? nowDay;

  TextEditingController nomi = TextEditingController();

  TextEditingController miqdori = TextEditingController();

  void submit(BuildContext context) {
    if (miqdori.text.isEmpty || nomi.text.isEmpty || nowDay == null) {
      return;
    } else {
      widget.getDataForAdd(nomi.text, int.parse(miqdori.text), nowDay);
      Navigator.of(context).pop();
    }
  }

  void takeDataBykalendar(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((_data) {
      if (_data != null) {
        setState(() {
          nowDay = _data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom + 50 : MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          children: [
            TextField(
              controller: nomi,
              decoration: const InputDecoration(
                label: Text("Xarajat nomi"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: miqdori,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Xarajat miqdori"),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                nowDay == null
                    ? Text("Kun hali tanlanmagan...")
                    : Text("${DateFormat("EEE, d MMM yyy").format(nowDay!)}"),
                TextButton(
                    onPressed: () {
                      takeDataBykalendar(context);
                    },
                    child: const Text(
                      "Kunni tanlash",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Bekor qilich",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      submit(context);
                    },
                    child: const Text("Saqlash"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
