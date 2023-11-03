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
  List<Meal> _items = [
    Meal(
        mId: 'm1',
        title: "Tarvuz",
        imgUrl: "assets/tarvuz.jpg",
        ingredients: [],
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
        ingredients: [],
        description: "ajoyib mevalar",
        preparingTime: 2,
        price: 1,
        categoryId: "r1"),
    Meal(
        mId: 'm6',
        title: "Lavash",
        imgUrl: "assets/lavash_1.jpg",
        ingredients: [],
        description: "ajoyib lavash",
        preparingTime: 12,
        price: 8,
        categoryId: "r2"),
  ];

  List<Meal> get item {
    return _items;
  }
}
