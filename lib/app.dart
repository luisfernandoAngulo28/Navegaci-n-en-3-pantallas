import 'package:flutter/material.dart';
import 'package:tarea3/core/theme/app_theme.dart';
import 'package:tarea3/screens/pantalla1_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegación 3 Pantallas',
      theme: AppTheme.theme,
      home: const Pantalla1Screen(),
    );
  }
}
