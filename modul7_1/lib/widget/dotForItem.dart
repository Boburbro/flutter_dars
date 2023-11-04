import 'package:flutter/material.dart';

class DotForItem extends StatelessWidget {
  final List<String> imgUrls;
  final int activeImgIndex;

  DotForItem(this.imgUrls, this.activeImgIndex);

  @override
  Widget build(BuildContext context) {
    print(activeImgIndex);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgUrls.map((img) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              color: activeImgIndex == imgUrls.indexOf(img)
                  ? Colors.black
                  : Colors.grey,
              shape: BoxShape.circle),
        );
      }).toList(),
    );
  }
}
