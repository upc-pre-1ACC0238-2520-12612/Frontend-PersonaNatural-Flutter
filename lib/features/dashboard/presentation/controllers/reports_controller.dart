import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../dashboard/presentation/controllers/rewards_controller.dart';

class ReportsController extends ChangeNotifier {
  final RewardsController rewardsController; // inyectado
  List<String> reports = [];
  bool loading = false;

  ReportsController(this.rewardsController) {
    loadReports();
  }

  Future<void> loadReports() async {
    reports = await LocalStorageService.getReports();
    notifyListeners();
  }

  Future<void> pickAndSaveFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final path = result.files.single.path!;
    await LocalStorageService.addReport(path);

    // añadir puntos automáticamente (ejemplo: +10)
    await rewardsController.addPoints(10);

    reports = await LocalStorageService.getReports();
    notifyListeners();
  }

  Future<void> delete(String path) async {
    await LocalStorageService.deleteReport(path);
    reports = await LocalStorageService.getReports();
    notifyListeners();
  }
}
