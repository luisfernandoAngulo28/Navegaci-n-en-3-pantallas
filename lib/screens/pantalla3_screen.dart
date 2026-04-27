import 'package:flutter/material.dart';
import 'package:tarea3/core/constants/app_colors.dart';
import 'package:tarea3/widgets/pantalla_header.dart';

class Pantalla3Screen extends StatelessWidget {
  final String nombre;

  const Pantalla3Screen({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PantallaHeader(
              titulo: 'Pantalla 3',
              subtitulo: 'Paso 3 de 3 — Destino',
              icono: Icons.celebration_rounded,
              gradiente: const [AppColors.pantalla3Start, AppColors.pantalla3End],
              paso: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  _TarjetaFinal(nombre: nombre),
                  const SizedBox(height: 24),
                  _BotonPrimario(
                    label: 'Ir al Inicio',
                    icono: Icons.home_rounded,
                    color: AppColors.pantalla3Start,
                    onPressed: () =>
                        Navigator.popUntil(context, (route) => route.isFirst),
                  ),
                  const SizedBox(height: 12),
                  _BotonSecundario(
                    label: 'Regresar a Pantalla 2',
                    icono: Icons.arrow_back_rounded,
                    color: AppColors.pantalla3Start,
                    onPressed: () => Navigator.pop(context),
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

class _TarjetaFinal extends StatelessWidget {
  final String nombre;

  const _TarjetaFinal({required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.cardWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.check_circle_rounded, size: 56, color: AppColors.pantalla3Start),
            const SizedBox(height: 16),
            Text(
              '$nombre, has llegado al final!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Completaste las 3 pantallas de navegación.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
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

class _BotonSecundario extends StatelessWidget {
  final String label;
  final IconData icono;
  final Color color;
  final VoidCallback onPressed;

  const _BotonSecundario({
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
      child: OutlinedButton.icon(
        icon: Icon(icono),
        label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: BorderSide(color: color, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
