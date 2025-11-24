import '../../domain/entities/eco_tip.dart';
import '../../domain/repositories/eco_tips_repository.dart';
import '../datasources/eco_tips_datasource.dart';

class EcoTipsRepositoryImpl implements EcoTipsRepository {
  final EcoTipsDataSource datasource;

  EcoTipsRepositoryImpl(this.datasource);

  @override
  Future<List<EcoTip>> getEcoTips() => datasource.getEcoTips();
}
