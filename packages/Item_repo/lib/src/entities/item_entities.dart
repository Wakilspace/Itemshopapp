class ItemsEntity {
  String itemId;
  String picture;
  String collection;
  String name;
  int size;
  int price;

  ItemsEntity(
      {required this.itemId,
      required this.picture,
      required this.collection,
      required this.name,
      required this.size,
      required this.price,
    }
    );

  Map<String, Object?> toJson() {
    return {
      'itemId': itemId,
      'picture': picture,
      'collection': collection,
      'name': name,
      'size': size,
      'price': price,
    };
  }

  static ItemsEntity fromJson(Map<String, dynamic> doc) {
    return ItemsEntity(
      itemId: doc['itemId'],
      picture: doc['picture'],
      collection: doc['collection'],
      name: doc['name'],
      size: doc['size'],
      price: doc['price'],
    );
  }
}
