import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/fake_backend_service.dart';
import 'core/theme/app_colors.dart';

// AUTH
import 'features/auth/presentation/login_screen.dart';

// DASHBOARD CONTROLLERS
import 'features/dashboard/presentation/controllers/eco_tips_controller.dart';
import 'features/dashboard/presentation/controllers/collection_points_controller.dart';
import 'features/dashboard/presentation/controllers/reports_controller.dart';
import 'features/dashboard/presentation/controllers/rewards_controller.dart'; // 👈 AGRÉGALO

// USECASES
import 'features/dashboard/domain/usecases/get_eco_tips.dart';
import 'features/dashboard/domain/usecases/get_collection_points.dart';

// REPOSITORIES
import 'features/dashboard/data/repositories/eco_tips_repository_impl.dart';
import 'features/dashboard/data/repositories/collection_points_repository_impl.dart';

// DATASOURCES
import 'features/dashboard/data/datasources/eco_tips_datasource.dart';
import 'features/dashboard/data/datasources/collection_points_datasource.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // 🌿 Eco Tips Provider
        ChangeNotifierProvider(
          create: (_) => EcoTipsController(
            GetEcoTipsUseCase(
              EcoTipsRepositoryImpl(
                EcoTipsDataSource(),
              ),
            ),
          ),
        ),

        // 📍 Collection Points Provider
        ChangeNotifierProvider(
          create: (_) => CollectionPointsController(
            GetCollectionPointsUseCase(
              CollectionPointsRepositoryImpl(
                CollectionPointsDataSource(),
              ),
            ),
          ),
        ),

        // 🎁 Rewards Provider
        ChangeNotifierProvider(
          create: (_) => RewardsController(
            FakeBackendService(),
          )..init(),
        ),

        // 📄 REPORTS PROVIDER (FALTABA)
        ChangeNotifierProvider(
          create: (ctx) => ReportsController(ctx.read<RewardsController>()),
        )

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoLife App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          background: AppColors.background,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
        ),
      ),

      home: const LoginScreen(),
    );
  }
}
