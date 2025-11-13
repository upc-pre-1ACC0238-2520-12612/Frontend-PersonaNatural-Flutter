import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recompensas"),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Recompensas Disponibles", style: AppTextStyles.title20),
          const SizedBox(height: 16),
          _buildReward("Descuento en tienda", "200 StayPoints"),
          _buildReward("Entrada gratuita a evento", "500 StayPoints"),
          _buildReward("Plantación de árbol", "1000 StayPoints"),
        ],
      ),
    );
  }

  Widget _buildReward(String title, String points) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.card_giftcard, color: AppColors.primary),
        title: Text(title),
        subtitle: Text(points),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
          ),
          child: const Text("Canjear"),
        ),
      ),
    );
  }
}
