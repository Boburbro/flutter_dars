import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieData extends StatefulWidget {
  // https://www.youtube.com/watch?v=6ZfuNTqbHE8
  // final List<Movie> _list;
  const MovieData({super.key});
  static const routeName = "/movie-data";

  @override
  State<MovieData> createState() => _MovieDataState();
}

class _MovieDataState extends State<MovieData> {
  @override
  Widget build(BuildContext context) {
    final List videoData = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      backgroundColor: const Color(0xFF15141F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videoData[0],
                      flags: const YoutubePlayerFlags(
                          autoPlay: false, mute: false),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  videoData[1],
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    videoData[2],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
