import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieData extends StatefulWidget {
  // https://www.youtube.com/watch?v=6ZfuNTqbHE8
  const MovieData({super.key});
  static const routeName = "/movie-data";

  @override
  State<MovieData> createState() => _MovieDataState();
}

class _MovieDataState extends State<MovieData> {
  late YoutubePlayerController _controller;
  String videoId = "6ZfuNTqbHE8";

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [YoutubePlayer(controller: _controller)]),
    );
  }
}
