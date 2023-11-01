import 'package:flutter/material.dart';

class category_item extends StatelessWidget {
  const category_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/tarvuz.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Mevalar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
