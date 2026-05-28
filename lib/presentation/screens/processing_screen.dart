import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/routes/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../domain/scan_result.dart';
import '../widgets/app_card.dart';
import '../widgets/app_page.dart';
import '../widgets/photo_placeholder.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacementNamed(AppRoutes.result, arguments: ScanResult.demo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppPage(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PhotoPlaceholder(height: 210),
              const SizedBox(height: AppSpacing.xl),
              const _AnalysisProgress(),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Menganalisis sampah...',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Model CNN memproses gambar langsung di perangkat.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnalysisProgress extends StatelessWidget {
  const _AnalysisProgress();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        children: const [
          LinearProgressIndicator(
            minHeight: 7,
            color: AppColors.green,
            backgroundColor: AppColors.border,
          ),
          SizedBox(height: AppSpacing.md),
          _PipelineStep(icon: Icons.crop_free_rounded, label: 'Deteksi objek'),
          SizedBox(height: AppSpacing.sm),
          _PipelineStep(icon: Icons.memory_rounded, label: 'Inferensi CNN'),
          SizedBox(height: AppSpacing.sm),
          _PipelineStep(icon: Icons.insights_rounded, label: 'Validasi hasil'),
        ],
      ),
    );
  }
}

class _PipelineStep extends StatelessWidget {
  const _PipelineStep({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.greenDark, size: 20),
        const SizedBox(width: AppSpacing.sm),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
