import '../../domain/entities/collection_point.dart';
import '../../domain/repositories/collection_points_repository.dart';
import '../datasources/collection_points_datasource.dart';

class CollectionPointsRepositoryImpl implements CollectionPointsRepository {
  final CollectionPointsDataSource datasource;

  CollectionPointsRepositoryImpl(this.datasource);

  @override
  Future<List<CollectionPoint>> getPoints() => datasource.getCollectionPoints();
}
