import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../auth/presentation/login_screen.dart';
import '../presentation/controllers/rewards_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final rewards = context.watch<RewardsController>(); // 👈 obtener puntos reales

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Inicio"),
        foregroundColor: AppColors.onPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: "Cerrar sesión",
            onPressed: () async {
              // Limpia los puntos guardados (opcional)
              // LocalStorageService.clear();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (_) => false,
              );
            },
          )
        ],
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ⭐ CARD DE KPIs
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Puntos", style: AppTextStyles.body14),
                        Text(
                          rewards.points.toString(),         // 👈 puntos reales
                          style: AppTextStyles.kpi,
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text("Kg reciclados", style: AppTextStyles.body14),
                        Text("35 kg", style: AppTextStyles.kpi), // puedes cambiarlo luego
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ⭐ PUNTOS CERCANOS
            const Text(
              "Puntos Cercanos de Reciclaje",
              style: AppTextStyles.title18,
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard("Recicla Central", "A 2 km"),
                  _buildCard("EcoPunto Miraflores", "A 3.5 km"),
                  _buildCard("GreenDrop", "A 5 km"),
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
