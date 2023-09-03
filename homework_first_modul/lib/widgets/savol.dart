import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SAVOL extends StatelessWidget {
  final JSON;
  final hozirgiraqam;
  Function onPass;

  SAVOL(this.JSON, this.hozirgiraqam, this.onPass);


  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(JSON[hozirgiraqam]["savol"], style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

              ElevatedButton(onPressed: () => onPass(JSON[hozirgiraqam]["javoblar"][0]['togrimi']), child: Text(JSON[hozirgiraqam]['javoblar'][0]['matn'])),
              ElevatedButton(onPressed: () => onPass(JSON[hozirgiraqam]["javoblar"][1]['togrimi']), child: Text(JSON[hozirgiraqam]['javoblar'][1]['matn'])),
              ElevatedButton(onPressed: () => onPass(JSON[hozirgiraqam]["javoblar"][2]['togrimi']), child: Text(JSON[hozirgiraqam]['javoblar'][2]['matn'])),
              ElevatedButton(onPressed: () => onPass(JSON[hozirgiraqam]["javoblar"][3]['togrimi']), child: Text(JSON[hozirgiraqam]['javoblar'][3]['matn'])),
            ],
          );
  }
}