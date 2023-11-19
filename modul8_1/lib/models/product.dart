class Product {
  final String id;
  final String title;
  final String des;
  final String imgUrl;
  Product({
    required this.id,
    required this.title,
    required this.des,
    required this.imgUrl,
  });
}

class Products {
  final List<Product> _items = [
    Product(
        id: "p1",
        title: "Samsung s23",
        des: "Eng zo'ri",
        imgUrl:
            "https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-hands-on-samsung-galaxy-s23-ultra-5g-green-color-mention-zana_qaradaghy-on-instagram-while-use-this-photo-follow-on-instagram-zana_qaradaghy.jpeg?auto=compress&cs=tinysrgb&w=1600")
  ];

  List<Product> get items {
    return _items;
  }
}
