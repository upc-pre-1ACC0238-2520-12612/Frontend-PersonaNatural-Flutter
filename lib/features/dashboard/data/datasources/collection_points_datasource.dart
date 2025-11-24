import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/collection_point_model.dart';

class CollectionPointsDataSource {
  Future<List<CollectionPointModel>> getCollectionPoints() async {
    final raw = await rootBundle.loadString("assets/mock/collection_points.json");
    final data = jsonDecode(raw);

    // Tu JSON es una lista directa:
    // [ {...}, {...}, {...} ]
    return (data as List)
        .map((e) => CollectionPointModel.fromJson(e))
        .toList();
  }
}
