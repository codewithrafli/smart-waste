import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../domain/waste_category.dart';
import '../widgets/app_card.dart';
import '../widgets/app_page.dart';
import '../widgets/category_tile.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ScreenHeader(title: 'Tentang Aplikasi'),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Smart Waste menggunakan model CNN di perangkat untuk membantu mengenali jenis sampah rumah tangga dari foto, lalu memberi saran penanganan yang sederhana dan praktis.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.lg),
            const _PrivacyCard(),
            const SizedBox(height: AppSpacing.lg),
            const CategoryTile(category: WasteCategory.organic),
            const SizedBox(height: AppSpacing.md),
            const CategoryTile(category: WasteCategory.inorganic),
          ],
        ),
      ),
    );
  }
}

class _PrivacyCard extends StatelessWidget {
  const _PrivacyCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      backgroundColor: AppColors.greenSoft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.security_rounded, color: AppColors.greenDark),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              'Foto diproses secara lokal sehingga alur kerja lebih cepat dan data pengguna tetap terlindungi.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.ink,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
