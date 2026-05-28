import 'package:flutter/material.dart';

import '../../core/routes/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../widgets/app_buttons.dart';
import '../widgets/app_card.dart';
import '../widgets/app_logo.dart';
import '../widgets/app_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPage(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const AppLogo(size: 44),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            'Smart Waste',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        IconButton.filledTonal(
                          tooltip: 'Info aplikasi',
                          onPressed: () =>
                              Navigator.of(context).pushNamed(AppRoutes.about),
                          icon: const Icon(Icons.info_outline_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const _ScanPanel(),
                    const SizedBox(height: AppSpacing.lg),
                    AppPrimaryButton(
                      label: 'Buka Kamera',
                      icon: Icons.photo_camera_rounded,
                      onPressed: () =>
                          Navigator.of(context).pushNamed(AppRoutes.capture),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    AppSecondaryButton(
                      label: 'Pilih dari Galeri',
                      icon: Icons.photo_library_rounded,
                      onPressed: () =>
                          Navigator.of(context).pushNamed(AppRoutes.processing),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const _EnterpriseStatusCard(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ScanPanel extends StatelessWidget {
  const _ScanPanel();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: 38,
      ),
      child: Column(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              color: AppColors.greenSoft,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(
              Icons.document_scanner_rounded,
              color: AppColors.green,
              size: 44,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Scan Sampah',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Ambil foto sampah rumah tangga untuk klasifikasi cepat menggunakan model CNN di perangkat.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _EnterpriseStatusCard extends StatelessWidget {
  const _EnterpriseStatusCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      backgroundColor: const Color(0xFFFBFDFC),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: const [
          _StatusRow(
            icon: Icons.memory_rounded,
            label: 'Model',
            value: 'CNN On-device',
          ),
          Divider(height: 22, color: AppColors.border),
          _StatusRow(
            icon: Icons.cloud_off_rounded,
            label: 'Privasi',
            value: 'Tanpa unggah foto',
          ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.greenDark),
        const SizedBox(width: AppSpacing.sm),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.ink,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
