import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NEWTODO extends StatefulWidget {

  final Function addNewToDo;

  NEWTODO(this.addNewToDo);

  @override
  State<NEWTODO> createState() => _NEWTODOState();
}

class _NEWTODOState extends State<NEWTODO> {
  DateTime? berilganKun2;
  final rejaNomi = TextEditingController();

  void getDataByKalendat2(BuildContext context){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100), 
      ).then((tanlanganKun2){
        if(tanlanganKun2 != null){
          setState(() {
            berilganKun2 = tanlanganKun2;
          });
        }
      });
  }
  void submit(){
    if (rejaNomi.text.isEmpty || berilganKun2 == null){
      return;
    }

  widget.addNewToDo(rejaNomi.text, berilganKun2);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
            padding: EdgeInsets.only(
              top: 16, 
              left: 16, 
              right: 16, 
              bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom + 16 : 100 
              
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(label: Text("Reja nomi")), 
                  controller: rejaNomi,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    berilganKun2 == null ? Text("Reja kuni tanlanmagan...") : Text(DateFormat('EEE, d MMM yyyy').format(berilganKun2!)),
                    TextButton(onPressed: (){
                      getDataByKalendat2(context);
                    }, child: Text("Kunni tanlash."))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
    
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("Bekor qilish",style: TextStyle(color: Colors.black),)),
                    ElevatedButton(onPressed: submit, child: Text("Saqlash")),
                  ],
                )
              ],
            ),
          ),
    );
  }
}