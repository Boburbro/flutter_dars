import 'package:flutter/material.dart';
import 'package:modul4_homework1/models/hamyon.dart';

class BUDGET extends StatelessWidget {
  final DateTime nowDay;
  final List<HamyonLimit> limitList;
  final Function changLimit, chack, changLimitScreen;

  BUDGET(this.limitList, this.changLimit, this.chack, this.nowDay,
      this.changLimitScreen);

  choicColor(double pr){
    if (pr >= 0 && pr <= 30){
      return Colors.green;
    }
    else if (pr > 30 && pr < 70){
      return Colors.yellow;
    }
    else{
      return Colors.red;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("Oylik byujet: ", style: TextStyle(color: choicColor((chack(nowDay) * 100) / limitList[0].limit)),),
              TextButton.icon(
                  onPressed: () {
                    changLimitScreen(context);
                  },
                  icon: Icon(
                    Icons.mode_rounded,
                  ),
                  label: Text("${limitList[0].limit}.00 so'm", style: TextStyle(color: choicColor((chack(nowDay) * 100) / limitList[0].limit))))
            ],
          ),
          Text(
              "${chack(nowDay) != 0 ? ((chack(nowDay) * 100) / limitList[0].limit) : 0}%")
        ],
      ),
    );
  }
}
