import 'package:flutter/material.dart';

import '../../../../core/services/fake_backend_service.dart';
import '../../../../core/services/local_storage_service.dart';

class RewardsController extends ChangeNotifier {
  final FakeBackendService backend;
  int points = 0;
  bool loading = false;
  List<Reward> rewards = [];

  RewardsController(this.backend);

  Future<void> init() async {
    points = await LocalStorageService.getPoints();
    rewards = await backend.fetchRewards();
    notifyListeners();
  }

  Future<String?> redeem(Reward reward) async {
    if (points < reward.cost) return "No tienes puntos suficientes 😿";
    loading = true;
    notifyListeners();

    final ok = await backend.redeemReward('me', reward.id);
    if (ok) {
      points -= reward.cost;
      await LocalStorageService.setPoints(points);
      await LocalStorageService.addRedeemed(reward.id);
      loading = false;
      notifyListeners();
      return null;
    } else {
      loading = false;
      notifyListeners();
      return "Error al canjear 🙀";
    }
  }

  Future<void> addPoints(int value) async {
    points += value;
    await LocalStorageService.setPoints(points);
    notifyListeners();
  }
}
