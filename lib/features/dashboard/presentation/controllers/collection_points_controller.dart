import 'package:flutter/material.dart';
import '../../domain/entities/collection_point.dart';
import '../../domain/usecases/get_collection_points.dart';

class CollectionPointsController extends ChangeNotifier {
  final GetCollectionPointsUseCase getPointsUseCase;

  CollectionPointsController(this.getPointsUseCase);

  List<CollectionPoint> points = [];
  bool isLoading = false;
  String? error;

  Future<void> loadPoints() async {
    isLoading = true;
    notifyListeners();

    try {
      points = await getPointsUseCase();
    } catch (e) {
      error = "No se pudieron cargar los puntos de acopio 😥";
    }

    isLoading = false;
    notifyListeners();
  }
}
