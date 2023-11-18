class Movie {
  final String mId;
  final String title;
  final String description;
  final String imgUrl;
  final String vId;

  Movie({
    required this.mId,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.vId,
  });
}

class Movies {
  final List<Movie> _list = [
    Movie(
      mId: "m1",
      title: "Avengers",
      description:
          """Marvel's The Avengers[5] (classified under the name Marvel Avengers Assemble in the United Kingdom and Ireland),
[1][6] or simply The Avengers, is a 2012 American superhero film based on the Marvel Comics superhero team of the 
same name. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures,[a] it is the sixth film 
in the Marvel Cinematic Universe (MCU). Written and directed by Joss Whedon, the film features an ensemble cast including 
Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth, Scarlett Johansson, and Jeremy Renner as the Avengers,
alongside Tom Hiddleston, Stellan Skarsgård, and Samuel L. Jackson. In the film, Nick Fury and the spy agency S.H.I.E.L.D. 
recruit Tony Stark, Steve Rogers, Bruce Banner, Thor, Natasha Romanoff, and Clint Barton to form a team capable of stopping 
Thor's brother Loki from subjugating Earth. 
""",
      imgUrl:
          "https://cdn.vox-cdn.com/thumbor/q1VhYtuVNtHtWRCb2icgjPzX3Sw=/0x0:1920x1005/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/15969338/surprise_marvel_releases_a_new_full_trailer_and_poster_for_avengers_endgame_social.jpg",
      vId: "6ZfuNTqbHE8",
    ),
    Movie(
      mId: "m2",
      title: "Iron Man",
      description: """

Temir odam Marvel Studios tomonidan ishlab chiqarilgan va Paramount Pictures tomonidan tarqatilgan, Marvel Comicsning superqahramoniga asoslangan, 2008-yilgi Amerikaning fantastik janridagi filmi. Marvel Kinokoinoti (MKK) ning birinchi filmi. Filmni Jon Favreau boshqargan. Mark Fergus va Hawk Ostby, shuningdek, Art Marcum va Matt Holloway yozuvchi guruhlari tomonidan ssenariysi bilan ijro etilgan. Terrence Xovard, Jeff Bridges, Shau Toub va Gviney Paltrow bilan birga Toni Stark/Temir odam rolidagi Robert Downey Jr. film voqealariga koʻra, milliarder Stark hayoti xavf ostida boʻlgan hodisadan keyin kuchli ekzoskelet quradi va texnologik jihatdan rivojlangan super qahramon Temir odamga aylanadi. 

""",
      imgUrl:
          "https://static.wikia.nocookie.net/marvelcinematicuniverse/images/3/35/IronMan-EndgameProfile.jpg/revision/latest/scale-to-width-down/1200?cb=20231025163251",
      vId: "uwmDH12MAA4",
    ),
    Movie(
      mId: "m3",
      title: "Hulk",
      description: "ajoyib marvel kinolaridan biri",
      imgUrl:
          "https://i.pinimg.com/736x/34/22/89/34228944de1b2631b888b3010f687bdf.jpg",
      vId: "u7JsKhI2An0",
    ),
    Movie(
        mId: "m4",
        title: "Spider-man 2",
        description: "O'ta go'zal",
        imgUrl:
            "https://movieposterhd.com/wp-content/uploads/2019/01/Spider-Man-Into-the-Spider-Verse-Poster-HD-.jpg",
            vId: "shW9i6k8cB0"),
    Movie(
        mId: "m5",
        title: "Spider-man 1",
        description: "cqGjhVJWtEg",
        imgUrl: "https://wallpapercg.com/media/ts_orig/14081.webp", vId: "cqGjhVJWtEg"),
    Movie(
        mId: "m6",
        title: "Tom and Jerry",
        description: "description",
        imgUrl:
            "https://yt3.googleusercontent.com/tKypRDTlAIvLLjNKSfuhSNNoBBmv5D2vW09rI-OGHtOJFZEg4YQUie9owJZnP0F6DDAu5xHO2A=s900-c-k-c0x00ffffff-no-rj", vId: "kP9TfCWaQT4"),
    Movie(
        mId: "m7",
        title: "Fiksiklar",
        description: "description",
        imgUrl: "https://images.uzmovi.com/ii/1589551333/60663d8b/30520800.jpg", vId: "t5Q8XlQvTxM")
  ];

  List<Movie> get list {
    return _list;
  }
}
