class Meal {
  final String mId;
  final String cId;
  final String title;
  final String imgUrl;
  final List<String> imgUrls;
  final List<String> ingredients;
  final String description;
  final int preparingTime;
  final double price;

  Meal({
    required this.mId,
    required this.cId,
    required this.title,
    required this.imgUrl,
    required this.imgUrls,
    required this.ingredients,
    required this.description,
    required this.preparingTime,
    required this.price,
  });
}

class Meals {
  final List<Meal> _items = [
    Meal(
      mId: 'm1',
      cId: "r1",
      title: "Tarvuz",
      imgUrl: "assets/tarvuz.jpg",
      imgUrls: [
        "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
        "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
        "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
      ],
      ingredients: ["tabiy", "bog'"],
      description: "ajoyib mevalar",
      preparingTime: 2,
      price: 5,
    ),
    Meal(
        mId: 'm2',
        title: "Banan",
        imgUrl: "assets/banan.jpg",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        ingredients: [],
        description: "ajoyib mevalar",
        preparingTime: 2,
        price: 15,
        cId: "r1"),
    Meal(
        mId: 'm3',
        title: "Gilos",
        imgUrl: "assets/gilos.jpg",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        ingredients: [],
        description: "ajoyib mevalar",
        preparingTime: 2,
        price: 3,
        cId: "r1"),
    Meal(
        mId: 'm4',
        title: "Nok",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        imgUrl: "assets/nok.jpg",
        ingredients: [],
        description: "ajoyib mevalar",
        preparingTime: 2,
        price: 10,
        cId: "r1"),
    Meal(
        mId: 'm5',
        title: "Olma",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        imgUrl: "assets/olma.jpg",
        ingredients: ["Taby", "Tog'dan"],
        description:
            """raʼnodoshlar oilasiga mansub, barg toʻkuvchi daraxtlar yoki butalar turkumi; urugʻli meva daraxti. 
            Shimoliy va janubiy yarim sharning moʻtadil mintaqalarida olmaning 25— 30 turi, jumladan, Sharqiy Osiyo, Oʻrta Osiyo va Kavkazda 10 xil turi tarqalgan. 
            Ekiladigan mevali daraxtlar orasida maydoni jihatidan birinchi oʻrinda turadi. 
            Yalpi olma hosili boʻyicha AQSH (4,8 mln. t), Xitoy (22,01 mln. t) oldingi oʻrinlarda turadi (1999). 
            Jahon boʻyicha yalpi hosili 60,2 mln. t ni tashkil etadi (1999). 
            Oʻzbekistonda —0,4 mln. t. AQSH, Chili, Xitoy, Rossiya, Eron, Turkiya, Fransiya, Italiya mamlakatlarida olmazorlar katta maydonlarni egallaydi. 
            Shuningdek Oʻzbekistonda 2017—2019-yillarda uzumni keyingi eng koʻp yetishtirilgan meva hisoblanadi.
            [1] Oʻzbekistonda 8 turi yovvoyi holda uchraydi (qarang yovvoyi olma). 
            Dunyo boʻyicha yetishtiriladigan navlarining asosiy qismi xonaki olma turiga kiradi. 
            Past boʻyli olma turiga kiradigan dusen va paradizkadan mevachilikda payvandtag sifatida foydalaniladi. 
            Olma sovuqqa chidamli, yorugʻsevar va namsevar, tuproq tanlamaydi, lekin unumdor tuproqlarda yuqori hosil beradi.""",
        preparingTime: 2,
        price: 1,
        cId: "r1"),
    Meal(
        mId: 'm6',
        title: "Lavash",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        imgUrl: "assets/lavash_1.jpg",
        ingredients: ["Go'sht", "Salat", "Mayanez"],
        description:
            "Odatda xamirturushli, an'anaviy ravishda tandirda (tonir) pishiriladigan va Janubiy Kavkaz, gʻarbiy Osiyo va Kaspiy dengizi atrofidagi hududlarning oshxonalari uchun odatiy boʻlgan yupqa tekis non[1][2][3] Lavash - Armaniston,Ozarbayjon,Eron va Turkiyada keng tarqalgan non turlaridan biri[4]. An'anaviy retsepti tonir oʻrniga panjara yoki wok yordamida zamonaviy oshxonaga moslashtirilishi mumkin[5].",
        preparingTime: 12,
        price: 8,
        cId: "r2"),
    Meal(
        mId: "m7",
        title: "Lavash",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        imgUrl: "assets/lavash_3.jpg",
        ingredients: [],
        description: "ajoyib lavash",
        preparingTime: 15,
        price: 6,
        cId: 'r2'),
    Meal(
        mId: "m8",
        title: "Osh",
        imgUrl: "assets/osh.jpg",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        ingredients: [],
        description: "ajoyib osh",
        preparingTime: 30,
        price: 20,
        cId: 'r3'),
    Meal(
        mId: "m9",
        title: "Choy",
        imgUrl: "assets/choy.jpg",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        ingredients: [],
        description: "ajoyib choy",
        preparingTime: 1,
        price: 1,
        cId: 'r4'),
    Meal(
        mId: "m10",
        title: "Koffee",
        imgUrl: "assets/kofe.jpg",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        ingredients: [],
        description: "ajoyib koffee",
        preparingTime: 2,
        price: 2,
        cId: 'r4'),
    Meal(
        mId: "m11",
        title: "Suv",
        imgUrl: "assets/water.jpg",
        imgUrls: [
          "https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/2966150/pexels-photo-2966150.jpeg?auto=compress&cs=tinysrgb&w=1600",
          "https://images.pexels.com/photos/1402659/pexels-photo-1402659.jpeg?auto=compress&cs=tinysrgb&w=1600"
        ],
        ingredients: [],
        description: "ajoyib suv",
        preparingTime: 1,
        price: 1,
        cId: 'r4'),
  ];

  List<Meal> get items {
    return _items;
  }

  List<Meal> _liked = [];
  List<Meal> get liked {
    return _liked;
  }

  void changeLiked(String mId) {
    final mealIndex = _liked.indexWhere((element) => element.mId == mId);
    if (mealIndex < 0) {
      _liked.add(_items.firstWhere((element) => element.mId == mId));
    } else {
      _liked.removeWhere((element) => element.mId == mId);
    }
  }
}
