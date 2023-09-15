import 'package:flutter/material.dart';

class DATA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_left, size:35)),
                  TextButton(
                    onPressed: (){},
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Firday, "
                          ),
                          TextSpan(
                            text: "6 aug"
                          )
                        ]
                      ) 
                      ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_right, size: 35)),

                ],
              );
  }
}