import 'package:flutter/material.dart';

class BACKGROUND extends StatelessWidget {

  // ignore: non_constant_identifier_names
  final Widget Page;

  BACKGROUND(this.Page);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img.jpg"), fit: BoxFit.fill)),
              child: Page,
            ),
          ],
        ),
      ),
    );
  }
}
