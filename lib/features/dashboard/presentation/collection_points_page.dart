import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class CollectionPointsPage extends StatelessWidget {
  const CollectionPointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puntos de Acopio"),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      backgroundColor: AppColors.background,
      body: const Center(
        child: Text(
          "Mapa de puntos de acopio (en desarrollo)",
          style: AppTextStyles.body16,
        ),
      ),
    );
  }
}
