class Article {
  int id;
  String name;
  String? shop;
  double? price;
  String? image;
  int list;
  Article(this.id, this.image, this.name, this.price, this.list, this.shop);
  Article.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        price = map["price"],
        shop = map["shop"],
        image = map["image"],
        list = map["list"];
}
