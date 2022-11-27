import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/screens/core/core.dart';
import 'package:pqr_sistema/src/services/bottom_service.dart';
import 'package:pqr_sistema/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reportar")),
      body: const HomeSwitch(),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}

class HomeSwitch extends StatelessWidget {
  const HomeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    switch (bottomService.selectedIndex) {
      case 0:
        return const ReportTab();
      case 1:
        return const ProfileTab();
      default:
        return const ReportTab();
    }
  }
}
