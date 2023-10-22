import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Models/IconPack.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:intl/intl.dart';

class ADDNEWEXPENSE extends StatefulWidget {
  final Function addNewExpenses;

  ADDNEWEXPENSE(this.addNewExpenses);

  @override
  State<ADDNEWEXPENSE> createState() => _ADDNEWEXPENSEState();
}

class _ADDNEWEXPENSEState extends State<ADDNEWEXPENSE> {
  DateTime? nowDay;
  IconData? takeIcon;

  TextEditingController nomi = TextEditingController();
  TextEditingController miqdor = TextEditingController();

  openKalendar(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        setState(() {
          nowDay = value;
        });
      }
    });
  }

  void submit() {
    double miqdorD = double.parse(miqdor.text);
    if (nomi.text.isEmpty ||
        miqdor.text.isEmpty ||
        nowDay == null ||
        miqdorD <= 0 ||
        takeIcon == null) {
      return;
    }
    widget.addNewExpenses(nomi.text, nowDay, miqdorD, takeIcon);
    Navigator.pop(context);
  }
  void openIcons(BuildContext context){
    FlutterIconPicker.showIconPicker(context, iconPackModes: [IconPack.cupertino], title: Text("Icon tanlash"), closeChild: Text("BEKOR QILISH")).then((value){
      setState(() {
        takeIcon = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: nomi,
            decoration: InputDecoration(
                labelText: "Xarajat nomi", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: miqdor,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Xarajat miqdori", border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              nowDay == null
                  ? Text("Kun tanlanmagan!")
                  : Text(
                      "Xarajat kuni: ${DateFormat('d MMM, yyyy').format(nowDay!)}"),
              TextButton(
                  onPressed: () {
                    openKalendar(context);
                  },
                  child: Text("Kunni tanlash"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              takeIcon == null
                  ? Text("Icon tanlanmagan!")
                  : Row(
                      children: [Text("Icon: "), Icon(takeIcon)],
                    ),
                    TextButton(onPressed: (){openIcons(context);}, child: Text("Icon tanlash"))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("BEKOR QILISH")),
              ElevatedButton(
                  onPressed: () {
                    submit();
                  },
                  child: Text("SAQLASH"))
            ],
          )
        ],
      ),
    );
  }
}
