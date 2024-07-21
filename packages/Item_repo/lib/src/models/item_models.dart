import '../entities/entities.dart';

class Items {
  String itemId;
  String picture;
  String collection;
  String name;
  int size;
  int price;

  Items(
      {required this.itemId,
      required this.picture,
      required this.collection,
      required this.name,
      required this.size,
      required this.price,
      }
    );

  ItemsEntity toEntity() {
    return ItemsEntity(
      itemId: itemId,
      picture: picture,
      collection: collection,
      name: name,
      size: size,
      price: price,
    );
  }

  static Items fromEntity(ItemsEntity entity) {
    return Items(
      itemId: entity.itemId,
      picture: entity.picture,
      collection: entity.collection,
      name: entity.name,
      size: entity.size,
      price: entity.price,
    );
  }
}
