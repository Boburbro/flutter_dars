import 'package:flutter/material.dart';
import 'package:modul6_homework/screens/game/gamepage.dart';
import 'package:modul6_homework/screens/game/ractangle.dart';
// import 'package:modul6_homework/screens/game/ractangle.dart';

class RACTANGLEBULDER extends StatefulWidget {
  final List _numbers, trueNumbers;
  RACTANGLEBULDER(this._numbers, this.trueNumbers);

  @override
  State<RACTANGLEBULDER> createState() => _RACTANGLEBULDERState();
}

class _RACTANGLEBULDERState extends State<RACTANGLEBULDER> {
  void changeItem(int oldIndex, int newIndex) {
    print(widget._numbers);
    setState(() {
      widget._numbers[newIndex] = widget._numbers[oldIndex];
      widget._numbers[oldIndex] = '16';
    });
  }

  void isFreeOneNext(int _index) {
    int i = _index;
    int i1 = i + 1;
    if (widget._numbers[i1] == '16') {
      changeItem(i, i1);
    }
  }

  void isFreeOneBack(int _index) {
    int i = _index;
    int i1 = i - 1;
    if (widget._numbers[i1] == '16') {
      changeItem(i, i1);
    }
  }

  void isFreeFourNext(int _index) {
    int i = _index;
    int i1 = i + 4;
    if (widget._numbers[i1] == '16') {
      changeItem(i, i1);
    }
  }

  void isFreeFourBack(int _index) {
    int i = _index;
    int i1 = i - 4;
    if (widget._numbers[i1] == '16') {
      changeItem(i, i1);
    }
  }

  chackGame() {
    int n = 0;
    for (var i = 0; i < 16; i++) {
      if (widget._numbers[i] == widget.trueNumbers[i]) {
        n++;
      }
    }
    if (n == 16) {
      return true;
    } else {
      return false;
    }
  }

  chandeIndex(int _index) {
    if (_index <= 3) {
      if (_index == 0) {
        isFreeOneNext(_index);
        isFreeFourNext(_index);
      } else if (_index == 1 || _index == 2) {
        isFreeFourNext(_index);
        isFreeOneBack(_index);
        isFreeOneNext(_index);
      } else if (_index == 3) {
        isFreeFourNext(_index);
        isFreeOneBack(_index);
      }
    } else if (3 < _index && _index <= 7) {
      if (_index == 4) {
        isFreeFourBack(_index);
        isFreeOneNext(_index);
        isFreeFourNext(_index);
      } else if (_index == 5 || _index == 6) {
        isFreeOneBack(_index);
        isFreeFourBack(_index);
        isFreeOneNext(_index);
        isFreeFourNext(_index);
      } else if (_index == 7) {
        isFreeFourBack(_index);
        isFreeOneBack(_index);
        isFreeFourNext(_index);
      }
    } else if (7 < _index && _index <= 11) {
      if (_index == 8) {
        isFreeFourBack(_index);
        isFreeOneNext(_index);
        isFreeFourNext(_index);
      } else if (_index == 9 || _index == 10) {
        isFreeOneBack(_index);
        isFreeFourBack(_index);
        isFreeOneNext(_index);
        isFreeFourNext(_index);
      } else if (_index == 11) {
        isFreeFourBack(_index);
        isFreeOneBack(_index);
        isFreeFourNext(_index);
      }
    } else if (11 < _index && _index <= 15) {
      if (_index == 12) {
        isFreeFourBack(_index);
        isFreeOneNext(_index);
      } else if (_index == 13 || _index == 14) {
        isFreeFourBack(_index);
        isFreeOneBack(_index);
        isFreeOneNext(_index);
      } else if (_index == 15) {
        isFreeFourBack(_index);
        isFreeOneBack(_index);
      }
    }

    if (chackGame()) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("You win!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text("EXIT")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GAMEPAGE(),
                      ));
                    },
                    child: Text("RESTART"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(5),
      crossAxisCount: 4,
      children: List.generate(
        16,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: RACTANGLE(widget._numbers[index], index, chandeIndex),
          );
        },
      ),
    );
  }
}
