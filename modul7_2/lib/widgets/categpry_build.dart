import 'package:flutter/material.dart';
import 'package:modul7_2/model/category.dart';

class CategoryBuild extends StatelessWidget {
  final Category _category;
  const CategoryBuild(this._category, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
      
        borderRadius: BorderRadius.circular(15),
        child: Stack(
    
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                _category.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
