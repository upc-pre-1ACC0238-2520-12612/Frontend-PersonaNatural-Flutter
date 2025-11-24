import '../entities/collection_point.dart';
import '../repositories/collection_points_repository.dart';

class GetCollectionPointsUseCase {
  final CollectionPointsRepository repository;

  GetCollectionPointsUseCase(this.repository);

  Future<List<CollectionPoint>> call() => repository.getPoints();
}
