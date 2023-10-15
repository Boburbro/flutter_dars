import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ADDEXPENSE extends StatefulWidget {
  final Function addNewExpense;

  ADDEXPENSE(this.addNewExpense);
  @override
  State<ADDEXPENSE> createState() => _ADDEXPENSEState();
}

class _ADDEXPENSEState extends State<ADDEXPENSE> {


  DateTime? takeDate;
  TextEditingController titleC = TextEditingController();
  TextEditingController amountC = TextEditingController();
  

  void takeDateByKalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: takeDate != null ? takeDate! : DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime.now(),
      helpText: "XARAJAT KUNNI TANLANG",
      cancelText: "BEKOR QILISH",
      confirmText: "TANLASH",
    ).then((value) {
      if (value != null) {
        setState(() {
          takeDate = value;
        });
      }
    });
  }

  void submit(){
    if (amountC.text.isEmpty){
      return;
    }
    double amountCint = double.parse(amountC.text);
    if (amountC.text.isEmpty || titleC.text.isEmpty || 0 >= amountCint || takeDate == null){
      return;
    }
    else{
      Navigator.of(context).pop();
      widget.addNewExpense(titleC.text, takeDate, amountCint);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Xarajat nomi",
            ),
            controller: titleC,
          ),
          const SizedBox(
            height: 7,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Xarajat miqdori",
            ),
            controller: amountC,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              takeDate == null
                  ? Text("Kun tanlanmagan!")
                  : Text(
                      "Xarajat kuni: ${DateFormat('dd MMMM, yyy').format(takeDate!)}"),
              // takeDate? Text("aa") : Text("data"),
              TextButton(
                  onPressed: () {
                    takeDateByKalendar(context);
                  },
                  child: const Text("Kunni tanlash"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("BEKOR QILISH")),
              ElevatedButton(onPressed: () {submit();}, child: Text("SAQLASH"))
            ],
          )
        ],
      ),
    );
  }
}
