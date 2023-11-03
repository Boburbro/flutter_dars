class Meal {
  final String mId;
  final String title;
  final String imgUrl;
  final List<String> ingredients;
  final String description;
  final int preparingTime;
  final double price;
  final String categoryId;
  bool isLike;

  Meal({
    required this.mId,
    required this.title,
    required this.imgUrl,
    required this.ingredients,
    required this.description,
    required this.preparingTime,
    required this.price,
    required this.categoryId,
    this.isLike = false,
  });
}

class Meals {
  // ignore: prefer_final_fields
  List<Meal> _items = [
    Meal(
        mId: 'm1',
        title: "Tarvuz",
        imgUrl: "assets/tarvuz.jpg",
        ingredients: ["tabiy", "bog'"],
        description: "ajoyib mevalar",
        preparingTime: 2,
        price: 5,
        categoryId: "r1"),
    Meal(
        mId: 'm2',
        title: "Banan",
        imgUrl: "assets/banan.jpg",
        ingredients: [],
        description: "ajoyib mevalar",
        preparingTime: 2,
        price: 15,
        categoryId: "r1"),
    Meal(
        mId: 'm3',
        title: "Gilos",
        imgUrl: "assets/gilos.jpg",
        ingredients: [],
        description: "ajoyib mevalar",
        preparingTime: 2,
        price: 3,
        categoryId: "r1"),
    Meal(
        mId: 'm4',
        title: "Nok",
        imgUrl: "assets/nok.jpg",
        ingredients: [],
        description: "ajoyib mevalar",
        preparingTime: 2,
        price: 10,
        categoryId: "r1"),
    Meal(
        mId: 'm5',
        title: "Olma",
        imgUrl: "assets/olma.jpg",
        ingredients: ["Taby", "Tog'dan"],
        description:
            "raʼnodoshlar oilasiga mansub, barg toʻkuvchi daraxtlar yoki butalar turkumi; urugʻli meva daraxti. Shimoliy va janubiy yarim sharning moʻtadil mintaqalarida olmaning 25— 30 turi, jumladan, Sharqiy Osiyo, Oʻrta Osiyo va Kavkazda 10 xil turi tarqalgan. Ekiladigan mevali daraxtlar orasida maydoni jihatidan birinchi oʻrinda turadi. Yalpi olma hosili boʻyicha AQSH (4,8 mln. t), Xitoy (22,01 mln. t) oldingi oʻrinlarda turadi (1999). Jahon boʻyicha yalpi hosili 60,2 mln. t ni tashkil etadi (1999). Oʻzbekistonda —0,4 mln. t. AQSH, Chili, Xitoy, Rossiya, Eron, Turkiya, Fransiya, Italiya mamlakatlarida olmazorlar katta maydonlarni egallaydi. Shuningdek Oʻzbekistonda 2017—2019-yillarda uzumni keyingi eng koʻp yetishtirilgan meva hisoblanadi.[1] Oʻzbekistonda 8 turi yovvoyi holda uchraydi (qarang yovvoyi olma). Dunyo boʻyicha yetishtiriladigan navlarining asosiy qismi xonaki olma turiga kiradi. Past boʻyli olma turiga kiradigan dusen va paradizkadan mevachilikda payvandtag sifatida foydalaniladi. Olma sovuqqa chidamli, yorugʻsevar va namsevar, tuproq tanlamaydi, lekin unumdor tuproqlarda yuqori hosil beradi. Olma daraxti boʻyi 15 m gacha boradi. Yaponiyada oʻtkazilgan tadqiqotlar shuni koʻrsatadiki, qishda ekilgan „Fuji“ olmalari mart oyining oxirida ildiz oʻsishi kuzatilgan.[2] Oʻzbekistonda olma aprel oyida gullaydi. Guli 5 boʻlakli, gultojibargi oq, pushti, ayrimlari qizil. Mevasi, naviga qarab, iyun— oktabrda pishadi. Bir dona mevasi vazni 15 g dan 400 g gacha boradi.",
        preparingTime: 2,
        price: 1,
        categoryId: "r1"),
    Meal(
        mId: 'm6',
        title: "Lavash",
        imgUrl: "assets/lavash_1.jpg",
        ingredients: ["Go'sht", "Salat", "Mayanez"],
        description:
            "Odatda xamirturushli, an'anaviy ravishda tandirda (tonir) pishiriladigan va Janubiy Kavkaz, gʻarbiy Osiyo va Kaspiy dengizi atrofidagi hududlarning oshxonalari uchun odatiy boʻlgan yupqa tekis non[1][2][3] Lavash - Armaniston,Ozarbayjon,Eron va Turkiyada keng tarqalgan non turlaridan biri[4]. An'anaviy retsepti tonir oʻrniga panjara yoki wok yordamida zamonaviy oshxonaga moslashtirilishi mumkin[5].",
        preparingTime: 12,
        price: 8,
        categoryId: "r2"),
    Meal(
        mId: "m7",
        title: "Lavash",
        imgUrl: "assets/lavash_3.jpg",
        ingredients: [],
        description: "ajoyib lavash",
        preparingTime: 15,
        price: 6,
        categoryId: 'r2'),
    Meal(
        mId: "m8",
        title: "Osh",
        imgUrl: "assets/osh.jpg",
        ingredients: [],
        description: "ajoyib osh",
        preparingTime: 30,
        price: 20,
        categoryId: 'r3'),
    Meal(
        mId: "m9",
        title: "Choy",
        imgUrl: "assets/choy.jpg",
        ingredients: [],
        description: "ajoyib choy",
        preparingTime: 1,
        price: 1,
        categoryId: 'r4'),
    Meal(
        mId: "m10",
        title: "Koffee",
        imgUrl: "assets/kofe.jpg",
        ingredients: [],
        description: "ajoyib koffee",
        preparingTime: 2,
        price: 2,
        categoryId: 'r4'),
    Meal(
        mId: "m11",
        title: "Suv",
        imgUrl: "assets/water.jpg",
        ingredients: [],
        description: "ajoyib suv",
        preparingTime: 1,
        price: 1,
        categoryId: 'r4'),
  ];

  List<Meal> get item {
    return _items;
  }
}
