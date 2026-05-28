import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

enum WasteCategory {
  organic(
    label: 'ORGANIK',
    title: 'Organik',
    color: AppColors.green,
    softColor: AppColors.greenSoft,
    icon: Icons.eco_rounded,
    examples: 'Sisa makanan, daun, kulit buah, sayuran',
    recommendation:
        'Bisa dijadikan kompos atau pakan ternak. Pisahkan dari plastik agar proses pengolahan tetap bersih.',
  ),
  inorganic(
    label: 'ANORGANIK / DAUR ULANG',
    title: 'Anorganik',
    color: AppColors.blue,
    softColor: AppColors.blueSoft,
    icon: Icons.recycling_rounded,
    examples: 'Plastik, kaleng, kaca, botol, kardus',
    recommendation:
        'Pisahkan dan setor ke bank sampah untuk didaur ulang. Bersihkan sisa makanan sebelum disimpan.',
  );

  const WasteCategory({
    required this.label,
    required this.title,
    required this.color,
    required this.softColor,
    required this.icon,
    required this.examples,
    required this.recommendation,
  });

  final String label;
  final String title;
  final Color color;
  final Color softColor;
  final IconData icon;
  final String examples;
  final String recommendation;
}
