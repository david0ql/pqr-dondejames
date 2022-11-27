import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/services/bottom_service.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reportar'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      currentIndex: bottomService.selectedIndex,
      onTap: (value) {
        bottomService.selectedIndex = value;
      },
    );
  }
}
