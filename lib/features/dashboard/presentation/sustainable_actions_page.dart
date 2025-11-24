import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'controllers/eco_tips_controller.dart';


class SustainableActionsPage extends StatefulWidget {
  const SustainableActionsPage({super.key});

  @override
  State<SustainableActionsPage> createState() => _SustainableActionsPageState();
}

class _SustainableActionsPageState extends State<SustainableActionsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<EcoTipsController>().loadTips();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EcoTipsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Acciones Sostenibles"),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.error != null
            ? Center(child: Text(controller.error!))
            : ListView.separated(
          itemCount: controller.tips.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final tip = controller.tips[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tip.title, style: AppTextStyles.title18),
                  const SizedBox(height: 8),
                  Text(tip.description, style: AppTextStyles.body16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
