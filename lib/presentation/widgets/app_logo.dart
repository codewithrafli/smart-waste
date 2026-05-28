import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.greenSoft,
        borderRadius: BorderRadius.circular(size * 0.3),
        border: Border.all(color: AppColors.green.withValues(alpha: 0.14)),
      ),
      child: Icon(
        Icons.recycling_rounded,
        color: AppColors.green,
        size: size * 0.5,
      ),
    );
  }
}
