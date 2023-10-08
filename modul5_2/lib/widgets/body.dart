import 'package:flutter/material.dart';
import 'package:modul5_2/widgets/expense_list.dart';

import './budget.dart';

class BODY extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              BUDGET(), 
              EXPENSELIST(),  
              
            ],
          );
  }
}