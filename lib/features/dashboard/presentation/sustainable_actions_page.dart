import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class SustainableActionsPage extends StatelessWidget {
  const SustainableActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Acciones Sostenibles"),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            "Reducir el impacto ambiental también es una estrategia empresarial inteligente 🌱",
            style: AppTextStyles.title18,
          ),
          SizedBox(height: 16),
          Text(
            "• Optimiza el uso de energía\n• Reduce el desperdicio de alimentos\n• Dona tus excedentes",
            style: AppTextStyles.body16,
          ),
        ],
      ),
    );
  }
}
