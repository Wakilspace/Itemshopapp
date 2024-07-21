import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:item_repo/item_repository.dart';

class FirebaseItemRepo implements ItemRepo {
  final itemColletion = FirebaseFirestore.instance.collection('items');

  Future<List<Items>> getItems() async {
    try {
      return await itemColletion
      .get()
      .then((value) => value.docs.map((e) =>
        Items.fromEntity(ItemsEntity.fromJson(e.data())) 
      ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
