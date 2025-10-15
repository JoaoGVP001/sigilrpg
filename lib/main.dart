import 'package:flutter/material.dart';
import 'package:sigilrpg/constants/app_colors.dart';
import 'package:sigilrpg/constants/app_routes.dart';
import 'package:sigilrpg/constants/app_theme.dart';
import 'package:sigilrpg/views/home/home_view.dart';

void main() {
  runApp(const SigilRpgApp());
}

class SigilRpgApp extends StatelessWidget {
  const SigilRpgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIGIL RPG',
      theme: buildAppTheme(brightness: Brightness.dark, seed: AppColors.seed),
      initialRoute: AppRoutes.home,
      routes: {AppRoutes.home: (_) => const HomeView()},
    );
  }
}
