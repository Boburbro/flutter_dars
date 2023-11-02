import 'package:flutter/material.dart';


class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/fast.jpg",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 200,
                    padding: const EdgeInsets.all(10),
                    color: Colors.black.withOpacity(0.5),
                    child: const Text(
                      "Burger",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.black54,
                        size: 20,
                      )),
                  const Text("\$12"),
                  const Text("15 minut"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
