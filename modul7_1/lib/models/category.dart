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
  // ignore: prefer_final_fields
  List<Category> _list = [
    const Category(id: 'r1', title: "Mevalar", imgurl: "assets/tarvuz.jpg"),
    const Category(id: 'r2', title: "Fast Food", imgurl: "assets/fast.jpg"),
    const Category(id: 'r3', title: "Milly taomlar", imgurl: "assets/osh.jpg"),
    const Category(id: 'r4', title: "Ichimliklar", imgurl: "assets/drinks.jpg"),
    const Category(id: 'r5', title: "Saladlar", imgurl: "assets/salad.jpg"),
  ];

  List<Category> get list{
    return _list;
  }
}
