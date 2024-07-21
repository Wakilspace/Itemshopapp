import 'models/models.dart';

abstract class ItemRepo {
  Future<List<Items>> getItems();
}
