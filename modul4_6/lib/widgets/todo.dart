import 'package:flutter/material.dart';
import 'package:modul4_6/models/reja_modeli.dart';

class TODO extends StatelessWidget {
  final List<RejaModeli> rejalar;

  TODO(this.rejalar);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rejalar.length < 10 ? "0${rejalar.length}" : "${rejalar.length}", 
                style: TextStyle(
                  fontWeight: FontWeight.w600
                )
              ),
              Text(
                "Barcha rejalaringiz", 
                style: TextStyle(
                  fontSize: 12, 
                  color: Colors.black54
                  )
                )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                rejalar.where((reja) => reja.isDane).length < 10 ? "0${rejalar.where((reja) => reja.isDane).length}" : "${rejalar.where((reja) => reja.isDane).length}", 
                style: TextStyle(fontWeight: FontWeight.w600
                )
              ),
              Text("Bajarilgan rejalaringiz", style: TextStyle(fontSize: 12, color: Colors.black54))
            ],
          )
        ],
      ),
    );
  }
} 