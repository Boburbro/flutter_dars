import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Models/IconPack.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:intl/intl.dart';
import 'package:modul5_6/widget/adabtive/adabtive_button.dart';
import 'package:modul5_6/widget/adabtive/adabtive_textFild.dart';

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 100 : MediaQuery.of(context).viewInsets.bottom + 10, top: 16, right: 16, left: 16),
        child: Column(
          children: [
            ADABTIVE_TEXT_FILD("Xarajat nomi", nomi, null),
            SizedBox(
              height: 10,
            ),
            ADABTIVE_TEXT_FILD("Xarajat miqdori", miqdor, TextInputType.number),
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
