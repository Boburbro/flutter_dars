import 'package:flutter/material.dart';
import 'package:modul7_homework/models/movies.dart';
import 'package:modul7_homework/widgets/trends.dart';

class CategoriesM extends StatelessWidget {
  final List<Movie> _movies;
  const CategoriesM(this._movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Film, Serial, Multifilmlar eng saralar faqat bizda!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: _movies.length,
              itemBuilder: (ctx, index) {
                return Trends(_movies[index].imgUrl, _movies[index].title);
              }),
        ),
      ],
    );
  }
}
