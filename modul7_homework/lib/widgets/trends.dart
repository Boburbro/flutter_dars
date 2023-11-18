import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:modul7_homework/screens/movie_data.dart';

class Trends extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String vId;
  final String descr;
  const Trends(this.imgUrl, this.title, this.vId, this.descr, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MovieData.routeName, arguments: [vId, title, descr]);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            SizedBox(
              width: 256,
              height: 336,
              child: Image.network(
                imgUrl,
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
                    child: Text(
                      title,
                      style: const TextStyle(
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
