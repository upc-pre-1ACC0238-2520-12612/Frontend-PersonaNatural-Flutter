import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../auth/presentation/login_screen.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  void _logout(BuildContext context) {
    // Simula cerrar sesión
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reportes"),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Resumen Mensual", style: AppTextStyles.title20),
          const SizedBox(height: 16),
          DataTable(
            columns: const [
              DataColumn(label: Text("Fecha")),
              DataColumn(label: Text("Residuo")),
              DataColumn(label: Text("Puntos")),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text("15/07/2024")),
                DataCell(Text("Plástico")),
                DataCell(Text("120")),
              ]),
              DataRow(cells: [
                DataCell(Text("22/07/2024")),
                DataCell(Text("Vidrio")),
                DataCell(Text("80")),
              ]),
              DataRow(cells: [
                DataCell(Text("29/07/2024")),
                DataCell(Text("Papel")),
                DataCell(Text("150")),
              ]),
            ],
          ),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton.icon(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.onPrimary,
                minimumSize: const Size(200, 48),
              ),
              icon: const Icon(Icons.logout),
              label: const Text("Cerrar sesión"),
            ),
          ),
        ],
      ),
    );
  }
}
