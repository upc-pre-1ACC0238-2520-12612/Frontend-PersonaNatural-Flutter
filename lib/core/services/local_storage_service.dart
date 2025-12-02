import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _kPoints = 'user_points';
  static const _kReports = 'user_reports'; // lista de rutas
  static const _kRedeemed = 'redeemed_rewards';

  // Points
  static Future<int> getPoints() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kPoints) ?? 0;
  }

  static Future<void> setPoints(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kPoints, value);
  }

  // Reports (list of file paths)
  static Future<List<String>> getReports() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kReports);
    if (raw == null) return [];
    return List<String>.from(jsonDecode(raw));
  }

  static Future<void> addReport(String path) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getReports();
    list.insert(0, path); // newest first
    await prefs.setString(_kReports, jsonEncode(list));
  }

  static Future<void> deleteReport(String path) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getReports();
    list.remove(path);
    await prefs.setString(_kReports, jsonEncode(list));
  }

  // Redeemed rewards (ids)
  static Future<List<String>> getRedeemed() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kRedeemed);
    if (raw == null) return [];
    return List<String>.from(jsonDecode(raw));
  }

  static Future<void> addRedeemed(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getRedeemed();

    if (!list.contains(id)) {
      list.add(id);
      await prefs.setString(_kRedeemed, jsonEncode(list));
    }
  }
}