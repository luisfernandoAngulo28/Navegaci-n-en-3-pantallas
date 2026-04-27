import 'package:flutter/material.dart';
import 'package:tarea3/core/constants/app_colors.dart';
import 'package:tarea3/screens/pantalla3_screen.dart';
import 'package:tarea3/widgets/pantalla_header.dart';
import 'package:tarea3/widgets/slide_route.dart';

class Pantalla2Screen extends StatelessWidget {
  final String nombre;

  const Pantalla2Screen({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PantallaHeader(
              titulo: 'Pantalla 2',
              subtitulo: 'Paso 2 de 3 — En camino',
              icono: Icons.route_rounded,
              gradiente: const [AppColors.pantalla2Start, AppColors.pantalla2End],
              paso: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  _TarjetaUsuario(nombre: nombre),
                  const SizedBox(height: 24),
                  _BotonPrimario(
                    label: 'Ir a Pantalla 3',
                    icono: Icons.arrow_forward_rounded,
                    color: AppColors.pantalla2Start,
                    onPressed: () => Navigator.push(
                      context,
                      slideRoute(Pantalla3Screen(nombre: nombre)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _BotonSecundario(
                    label: 'Volver a Pantalla 1',
                    icono: Icons.arrow_back_rounded,
                    color: AppColors.pantalla2Start,
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

class _TarjetaUsuario extends StatelessWidget {
  final String nombre;

  const _TarjetaUsuario({required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.cardWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFFE8FFF5),
              child: Text(
                nombre.isNotEmpty ? nombre[0].toUpperCase() : 'V',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.pantalla2Start,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola, $nombre!',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Estás avanzando muy bien.',
                    style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
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
