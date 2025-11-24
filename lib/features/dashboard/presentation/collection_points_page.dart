import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'controllers/collection_points_controller.dart';

class CollectionPointsPage extends StatefulWidget {
  const CollectionPointsPage({super.key});

  @override
  State<CollectionPointsPage> createState() => _CollectionPointsPageState();
}

class _CollectionPointsPageState extends State<CollectionPointsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CollectionPointsController>().loadPoints();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CollectionPointsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Puntos de Acopio"),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      backgroundColor: AppColors.background,
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : controller.error != null
          ? Center(child: Text(controller.error!))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.points.length,
        itemBuilder: (context, index) {
          final point = controller.points[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: const Icon(Icons.location_on,
                  color: AppColors.primary),
              title: Text(point.name,
                  style: AppTextStyles.title16),
              subtitle: Text(point.address),
            ),
          );
        },
      ),
    );
  }
}
