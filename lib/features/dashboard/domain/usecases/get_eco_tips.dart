import '../entities/eco_tip.dart';
import '../repositories/eco_tips_repository.dart';

class GetEcoTipsUseCase {
  final EcoTipsRepository repository;

  GetEcoTipsUseCase(this.repository);

  Future<List<EcoTip>> call() => repository.getEcoTips();
}
