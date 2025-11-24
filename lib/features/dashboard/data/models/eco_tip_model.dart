import '../../domain/entities/eco_tip.dart';

class EcoTipModel extends EcoTip {
  EcoTipModel({required super.title, required super.description});

  factory EcoTipModel.fromJson(Map<String, dynamic> json) {
    return EcoTipModel(
      title: json['title'],
      description: json['description'],
    );
  }
}
