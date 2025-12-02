import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/services/fake_backend_service.dart';
import 'controllers/rewards_controller.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});
  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<RewardsController>().init());
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<RewardsController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Recompensas'), backgroundColor: AppColors.primary),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Puntos: ${ctrl.points}', style: AppTextStyles.title20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ctrl.rewards.length,
              itemBuilder: (context, i) {
                final r = ctrl.rewards[i];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(r.title),
                    subtitle: Text('Costo: ${r.cost} pts'),
                    trailing: ElevatedButton(
                      onPressed: ctrl.loading ? null : () async {
                        final err = await ctrl.redeem(r);
                        if (err != null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Redimido con éxito 😸')));
                        }
                      },
                      child: const Text('Canjear'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // For demo: add fixed points quickly
          await context.read<RewardsController>().addPoints(50);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
