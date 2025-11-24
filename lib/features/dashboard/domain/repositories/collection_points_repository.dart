import '../entities/collection_point.dart';

/// Contrato que define las acciones disponibles para puntos de acopio.
abstract class CollectionPointsRepository {
  /// Retorna los puntos de acopio desde la fuente de datos.
  Future<List<CollectionPoint>> getPoints();
}
