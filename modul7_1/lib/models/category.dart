class Category {
  final String id;
  final String title;
  final String imgurl;

  const Category({
    required this.id,
    required this.title,
    required this.imgurl,
  });
}

class Categories {
  List<Category> _list = [
    Category(id: 'r1', title: "Mevalar", imgurl: "assets/tarvuz.jpg"),
    Category(id: 'r2', title: "Fast Food", imgurl: "assets/fast.jpg"),
    Category(id: 'r3', title: "Milly taomlar", imgurl: "assets/osh.jpg"),
    Category(id: 'r4', title: "Ichimliklar", imgurl: "assets/drinks.jpg"),
    Category(id: 'r5', title: "Saladlar", imgurl: "assets/salad.jpg"),
  ];

  List<Category> get list{
    return _list;
  }
}
