import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'home_page.dart';
import 'rewards_page.dart';
import 'sustainable_actions_page.dart';
import 'collection_points_page.dart';
import 'reports_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    RewardsPage(),
    SustainableActionsPage(),
    CollectionPointsPage(),
    ReportsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surface,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined), label: 'Recompensas'),
          BottomNavigationBarItem(icon: Icon(Icons.eco_outlined), label: 'Acciones Sostenibles'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'Puntos de Acopio'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: 'Reportes'),
        ],
      ),
    );
  }
}
