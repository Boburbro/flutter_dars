import 'package:flutter/material.dart';

class category_item extends StatelessWidget {
  final String title;
  final String imgUrl;
  
  const category_item(
    this.title,
    this.imgUrl,
    
    {
    super.key,
  });

  void _goTocategoryMealScreen(BuildContext context){
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CategoryMealScreen(title)));
    Navigator.of(context).pushNamed('/category-meals', arguments: title);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goTocategoryMealScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
