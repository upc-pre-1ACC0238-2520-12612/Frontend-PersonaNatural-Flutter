import '../../domain/entities/collection_point.dart';

class CollectionPointModel extends CollectionPoint {
  CollectionPointModel({
    required super.id,
    required super.name,
    required super.address,
    required super.lat,
    required super.lng,
  });

  factory CollectionPointModel.fromJson(Map<String, dynamic> json) {
    return CollectionPointModel(
      id: json["id"].toString(),             // 👈 lo agregamos
      name: json["name"],
      address: json["vicinity"],             // 👈 tu JSON usa “vicinity”
      lat: (json["lat"] as num).toDouble(),  // 👈 convertir num → double
      lng: (json["lng"] as num).toDouble(),
    );
  }
}
