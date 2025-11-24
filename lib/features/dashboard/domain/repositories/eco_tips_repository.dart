import '../entities/eco_tip.dart';

/// Contrato que define lo que el repositorio debe poder hacer.
abstract class EcoTipsRepository {
  /// Obtiene una lista de tips ecológicos desde el datasource.
  Future<List<EcoTip>> getEcoTips();
}
