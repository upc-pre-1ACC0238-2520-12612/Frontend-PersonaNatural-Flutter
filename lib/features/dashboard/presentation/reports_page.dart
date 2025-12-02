import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/services/local_storage_service.dart';
import 'package:open_filex/open_filex.dart';

// 👇 IMPORT CLAVE PARA SUMAR PUNTOS
import '../../dashboard/presentation/controllers/rewards_controller.dart';

import 'controllers/reports_controller.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ReportsController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reportes reciclados"),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          await controller.pickAndSaveFile();

          // ➕ Añadir puntos
          context.read<RewardsController>().addPoints(10);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Reporte subido 📄 +10 puntos añadidos 🌱"),
            ),
          );
        },
        child: const Icon(Icons.upload),
      ),

      body: controller.loading
          ? const Center(child: CircularProgressIndicator())
          : controller.reports.isEmpty
          ? const Center(child: Text("No hay reportes aún"))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.reports.length,
        itemBuilder: (_, i) {
          final path = controller.reports[i];
          final name = path.split('/').last;

          return Card(
            child: ListTile(
              leading: Icon(
                fileIcon(path),
                size: 34,
                color: AppColors.primary,
              ),
              title: Text(name, style: AppTextStyles.body16),
              subtitle: Text("Toca para abrir",
                  style: AppTextStyles.body14),
              onTap: () => OpenFilex.open(path),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline,
                    color: Colors.red),
                onPressed: () =>
                    _confirmDelete(context, path),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, String path) async {
    final controller = Provider.of<ReportsController>(context, listen: false);

    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("¿Eliminar reporte?"),
        content: const Text("¿Seguro que deseas eliminar este archivo?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Eliminar"),
          ),
        ],
      ),
    );

    if (ok == true) {
      await controller.delete(path);
    }
  }

  IconData fileIcon(String path) {
    final ext = path.toLowerCase();

    if (ext.endsWith('.pdf')) return Icons.picture_as_pdf;
    if (ext.endsWith('.jpg') || ext.endsWith('.jpeg')) return Icons.image;
    if (ext.endsWith('.png')) return Icons.image;
    if (ext.endsWith('.doc') || ext.endsWith('.docx')) return Icons.description;

    return Icons.insert_drive_file;
  }
}
