class Category {
  final String cId;
  final String title;
  final String imgUrl;
  Category({
    required this.cId,
    required this.title,
    required this.imgUrl, 
  });
}

class Categories {
  // ignore: prefer_final_fields
  List<Category> _item = [
    Category(cId: "c1", title: "Mevalar", imgUrl: "assets/banan.jpg"),
    Category(cId: 'r2', title: "Fast Food", imgUrl: "assets/fast.jpg"),
    Category(cId: 'r3', title: "Milly taomlar", imgUrl: "assets/osh.jpg"),
    Category(cId: 'r4', title: "Ichimliklar", imgUrl: "assets/drinks.jpg"),
    Category(cId: 'r5', title: "Saladlar", imgUrl: "assets/salad.jpg"),
  ];
  List<Category> get item {
    return _item;
  }
}
