import 'package:flutter/material.dart';
import '../../domain/entities/eco_tip.dart';
import '../../domain/usecases/get_eco_tips.dart';

class EcoTipsController extends ChangeNotifier {
  final GetEcoTipsUseCase getEcoTipsUseCase;

  EcoTipsController(this.getEcoTipsUseCase);

  List<EcoTip> tips = [];
  bool isLoading = false;
  String? error;

  Future<void> loadTips() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      tips = await getEcoTipsUseCase();
    } catch (e) {
      error = "No se pudieron cargar los eco tips 😥";
    }

    isLoading = false;
    notifyListeners();
  }
}
