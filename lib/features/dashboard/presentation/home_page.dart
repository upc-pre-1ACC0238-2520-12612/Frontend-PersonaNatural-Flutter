import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Inicio"),
        foregroundColor: AppColors.onPrimary,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Column(
                      children: [
                        Text("Puntos", style: AppTextStyles.body14),
                        Text("1,250", style: AppTextStyles.kpi),
                      ],
                    ),
                    Column(
                      children: [
                        Text("Kg reciclados", style: AppTextStyles.body14),
                        Text("35 kg", style: AppTextStyles.kpi),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Puntos Cercanos de Reciclaje", style: AppTextStyles.title18),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard("EcoPunto Central", "A 2 km"),
                  _buildCard("ReciclaYa", "A 3.5 km"),
                  _buildCard("VerdeCentro", "A 5 km"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String distance) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.recycling, color: AppColors.primary, size: 48),
              const SizedBox(height: 8),
              Text(title, style: AppTextStyles.body16),
              Text(distance, style: AppTextStyles.body14),
            ],
          ),
        ),
      ),
    );
  }
}
