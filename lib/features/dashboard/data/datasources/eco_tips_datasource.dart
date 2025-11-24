import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/eco_tip_model.dart';

class EcoTipsDataSource {
  final String url = "https://dummyjson.com/quotes"; // API ejemplo

  Future<List<EcoTipModel>> getEcoTips() async {
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return (data["quotes"] as List)
          .map((e) => EcoTipModel(title: e["author"], description: e["quote"]))
          .toList();
    } else {
      throw Exception("Error loading eco tips");
    }
  }
}
