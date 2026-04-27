import 'package:flutter/material.dart';
import 'package:tarea3/core/constants/app_colors.dart';

class IndicadorPasos extends StatelessWidget {
  final int pasoActual;

  const IndicadorPasos({super.key, required this.pasoActual});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        final activo = i + 1 == pasoActual;
        final completado = i + 1 < pasoActual;
        return Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: activo ? 36 : 12,
              height: 12,
              decoration: BoxDecoration(
                color: completado
                    ? AppColors.stepCompleted
                    : activo
                        ? AppColors.stepActive
                        : AppColors.stepInactive,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            if (i < 2)
              Container(
                width: 20,
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                color: completado ? AppColors.stepCompleted : AppColors.stepInactive,
              ),
          ],
        );
      }),
    );
  }
}
