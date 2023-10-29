import 'package:flutter/material.dart';
import 'package:modul6_homework/screens/game/ractanglebuilder.dart';

import 'dart:math';

class FIELD extends StatefulWidget {
  @override
  State<FIELD> createState() => _FIELDState();
}

class _FIELDState extends State<FIELD> {
  List<List<String>> allNumbers = [
    [
      '14',
      "5",
      '13',
      '3',
      "16",
      "8",
      "1",
      "7",
      "9",
      "10",
      "11",
      "15",
      '4',
      "12",
      "2",
      "6"
    ],
    [
      '5',
      '12',
      '8',
      '3',
      '4',
      '14',
      '13',
      '1',
      '11',
      '16',
      '10',
      '7',
      '2',
      '9',
      '6',
      '15'
    ],
    [
      '7',
      '6',
      '3',
      '5',
      '14',
      '8',
      '4',
      '15',
      '1',
      '2',
      '16',
      '12',
      '13',
      '10',
      '11',
      '9'
    ],
    [
      '8',
      '13',
      '16',
      '4',
      '14',
      '2',
      '5',
      '1',
      '7',
      '11',
      '6',
      '12',
      '3',
      '9',
      '15',
      '10'
    ],
    [
      '3',
      '11',
      '9',
      '15',
      '14',
      '10',
      '7',
      '5',
      '4',
      '8',
      '16',
      '6',
      '2',
      '1',
      '13',
      '12'
    ]
  ];

  List _numbers1() {
    Random _random = Random();
    List _numbers1 = allNumbers[_random.nextInt(allNumbers.length)];
    return _numbers1;
  }

  List<String> trueNumbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 345,
          height: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Color(0xFF0061FF),
              Color(0xFF60EFFF),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: RACTANGLEBULDER(_numbers1(), trueNumbers),
        ),
      ],
    );
  }
}
