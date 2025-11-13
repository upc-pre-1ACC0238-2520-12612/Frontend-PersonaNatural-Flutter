import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../dashboard/presentation/dashboard_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: AppColors.success, size: 80),
              const SizedBox(height: 20),
              const Text(
                "Registro exitoso 🎉",
                style: AppTextStyles.title24,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                "Su cuenta ha sido creada con éxito.\nPor favor revise su correo electrónico para activar su cuenta y comenzar a disfrutar de todos los beneficios.",
                style: AppTextStyles.body16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text("Ir a inicio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
