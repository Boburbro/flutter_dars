import 'dart:ui';

import 'package:flutter/material.dart';

class Trends extends StatelessWidget {
  const Trends({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            SizedBox(
              width: 256,
              height: 336,
              child: Image.network(
                "https://images.pexels.com/photos/10682514/pexels-photo-10682514.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    alignment: Alignment.center,
                    width: 221,
                    height: 80,
                    child: const Text(
                      "Qasoskorlar",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
