import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modul7_homework/models/movies.dart';
import 'package:modul7_homework/screens/movie_data.dart';
import 'package:modul7_homework/widgets/trends.dart';

class Home extends StatelessWidget {
  final List<Movie> _movies;
  const Home(this._movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Trendlar",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 300,
                  height: 336,
                  child: CarouselSlider(
                    items: [
                      Trends(_movies[0].imgUrl, _movies[0].title,
                          _movies[0].vId, _movies[0].description),
                      Trends(_movies[1].imgUrl, _movies[1].title,
                          _movies[1].vId, _movies[1].description),
                      Trends(_movies[2].imgUrl, _movies[2].title,
                          _movies[2].vId, _movies[2].description),
                      Trends(_movies[3].imgUrl, _movies[3].title,
                          _movies[3].vId, _movies[3].description),
                    ],
                    options: CarouselOptions(
                        height: 336,
                        viewportFraction: 0.8,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 5 / 4),
                  ),
                )
              ],
            ),
            const SizedBox(height: 36),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Eng mashxur",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 24),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(MovieData.routeName,
                          arguments: [
                            _movies[1].vId,
                            _movies[1].title,
                            _movies[1].description
                          ]);
                    },
                    child: engMashhur()),
                const Text(
                  """

Temir odam Marvel Studios tomonidan ishlab chiqarilgan va Paramount Pictures tomonidan tarqatilgan, Marvel Comicsning superqahramoniga asoslangan, 2008-yilgi Amerikaning fantastik janridagi filmi. Marvel Kinokoinoti (MKK) ning birinchi filmi. Filmni Jon Favreau boshqargan. Mark Fergus va Hawk Ostby, shuningdek, Art Marcum va Matt Holloway yozuvchi guruhlari tomonidan ssenariysi bilan ijro etilgan. Terrence Xovard, Jeff Bridges, Shau Toub va Gviney Paltrow bilan birga Toni Stark/Temir odam rolidagi Robert Downey Jr. film voqealariga koʻra, milliarder Stark hayoti xavf ostida boʻlgan hodisadan keyin kuchli ekzoskelet quradi va texnologik jihatdan rivojlangan super qahramon Temir odamga aylanadi. 

""",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class engMashhur extends StatelessWidget {
  const engMashhur({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          SizedBox(
            width: 327,
            height: 191,
            child: Image.network(
              "https://assets-prd.ignimgs.com/2022/09/21/collage-maker-20-sep-2022-11-29-pm-1-1663730990588.jpg?crop=16%3A9&width=888",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    alignment: Alignment.center,
                    width: 221,
                    height: 60,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.play_arrow_rounded,
                          color: Color(0xFFF75F47),
                          size: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Marvel",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 223, 222, 222)),
                            ),
                            Text(
                              "Temir odam",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
