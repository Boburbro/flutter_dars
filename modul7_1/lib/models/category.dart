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
    Category(id: 'r1', title: "Mevalar", imgurl: "assets/tarvuz.jpg")
  ];

  List<Category> get list{
    return _list;
  }
}
