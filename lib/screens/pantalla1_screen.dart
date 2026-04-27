import 'package:flutter/material.dart';
import 'package:tarea3/core/constants/app_colors.dart';
import 'package:tarea3/screens/pantalla2_screen.dart';
import 'package:tarea3/widgets/pantalla_header.dart';
import 'package:tarea3/widgets/slide_route.dart';

class Pantalla1Screen extends StatefulWidget {
  const Pantalla1Screen({super.key});

  @override
  State<Pantalla1Screen> createState() => _Pantalla1ScreenState();
}

class _Pantalla1ScreenState extends State<Pantalla1Screen> {
  final _nombreController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  void _irAPantalla2() {
    final nombre = _nombreController.text.trim().isEmpty
        ? 'Visitante'
        : _nombreController.text.trim();
    Navigator.push(context, slideRoute(Pantalla2Screen(nombre: nombre)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PantallaHeader(
              titulo: 'Pantalla 1',
              subtitulo: 'Paso 1 de 3 — Inicio',
              icono: Icons.waving_hand_rounded,
              gradiente: [AppColors.pantalla1Start, AppColors.pantalla1End],
              paso: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  _TarjetaNombre(controller: _nombreController),
                  const SizedBox(height: 24),
                  _BotonPrimario(
                    label: 'Ir a Pantalla 2',
                    icono: Icons.arrow_forward_rounded,
                    color: AppColors.pantalla1Start,
                    onPressed: _irAPantalla2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TarjetaNombre extends StatelessWidget {
  final TextEditingController controller;

  const _TarjetaNombre({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.cardWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Ingresa tu nombre para personalizar tu experiencia.',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Tu nombre',
                hintText: 'Ej: María García',
                prefixIcon: const Icon(Icons.person_outline),
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonPrimario extends StatelessWidget {
  final String label;
  final IconData icono;
  final Color color;
  final VoidCallback onPressed;

  const _BotonPrimario({
    required this.label,
    required this.icono,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        icon: Icon(icono),
        label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 4,
          shadowColor: color.withAlpha(100),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
