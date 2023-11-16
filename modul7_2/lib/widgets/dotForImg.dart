import 'package:flutter/material.dart';

class DotForImg extends StatelessWidget {
  final int activeImgIndex;
  final List<String> imgs;

  DotForImg(this.activeImgIndex, this.imgs, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgs.map(
        (img) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: activeImgIndex == imgs.indexOf(img)
                    ? Colors.black
                    : Colors.grey,
                // color: Colors.black,
                shape: BoxShape.circle),
          );
        },
      ).toList(),
    );
  }
}
