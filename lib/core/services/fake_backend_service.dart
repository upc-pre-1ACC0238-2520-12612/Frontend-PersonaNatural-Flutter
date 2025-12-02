import 'dart:async';

// Simple models (you can move them to separate files)
class EcoTip { final String id, title, description; EcoTip(this.id,this.title,this.description); }
class Reward { final String id, title; final int cost; final String imageUrl; Reward({required this.id, required this.title, required this.cost, required this.imageUrl}); }
class CollectionPoint { final String id, name, vicinity; final double lat, lng; CollectionPoint(this.id,this.name,this.vicinity,this.lat,this.lng); }

class FakeBackendService {
  // Simulate network delay
  Future<List<EcoTip>> fetchEcoTips() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return List.generate(10, (i) => EcoTip('tip$i','Tip ${i+1}','Consejo ecológico número ${i+1}'));
  }

  Future<List<CollectionPoint>> fetchCollectionPoints() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      CollectionPoint('1','Recicla Central','Av. La Marina 123', -12.0825, -77.0761),
      CollectionPoint('2','Eco Punto Miraflores','Calle Berlin 550', -12.1223, -77.0291),
      CollectionPoint('3','GreenDrop Pueblo Libre','Av. Sucre 890', -12.0770, -77.0621),
      // añade más hasta 5-10
    ];
  }

  Future<List<Reward>> fetchRewards() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      Reward(id: 'r1', title: 'Copa Reutilizable', cost: 100, imageUrl: ''),
      Reward(id: 'r2', title: 'Bolsa Ecológica', cost: 60, imageUrl: ''),
      Reward(id: 'r3', title: 'Descuento en reciclaje', cost: 200, imageUrl: ''),
      Reward(id: 'r4', title: 'Kit de siembra', cost: 150, imageUrl: ''),
      // agrega hasta 5-8 para sumar datos
    ];
  }

  // Simulate redeem (would check server in real backend)
  Future<bool> redeemReward(String userId, String rewardId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }
}
