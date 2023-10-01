import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NEWTODO extends StatefulWidget {
  final addToDoAsNew;

  NEWTODO(this.addToDoAsNew);

  @override
  State<NEWTODO> createState() => _NEWTODOState();
}

class _NEWTODOState extends State<NEWTODO> {
  final rejaNomi = TextEditingController();

  DateTime? nowDay;

  void takeDataBykalendar(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100))
        .then((_data) {
      if (_data != null) {
        setState(() {
          nowDay = _data;
        });
      }
    });
  }

  void submit() {
    if (nowDay == null || rejaNomi.text.isEmpty) {
      return;
    }
    widget.addToDoAsNew(rejaNomi.text, nowDay);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom + 20
                : 100),
        child: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(label: Text("Reja nomi")),
                controller: rejaNomi,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  nowDay == null
                      ? Text("Kun tanlanmagan...")
                      : Text(DateFormat("EEE, d MMM yyy").format(nowDay!)),
                  TextButton(
                      onPressed: () {
                        takeDataBykalendar(context);
                      },
                      child: Text("Kunni tanlash"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Bekor qilish",
                        style: TextStyle(color: Colors.black),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        submit();
                      },
                      child: Text("Saqlash"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
