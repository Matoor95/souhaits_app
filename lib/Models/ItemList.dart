class ItemList {
  int id;
  String name;
  ItemList(this.id, this.name);
  // recuperer les donnes en map
  ItemList.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"];
}
