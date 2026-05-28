import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const SmartWasteApp());
}

class SmartWasteApp extends StatelessWidget {
  const SmartWasteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Waste Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.green,
          primary: AppColors.green,
          surface: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
            height: 1.1,
          ),
          headlineMedium: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
          titleLarge: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w800,
            color: AppColors.ink,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.muted,
            height: 1.55,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.muted,
            height: 1.5,
          ),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class AppColors {
  static const green = Color(0xFF22C55E);
  static const greenSoft = Color(0xFFEAFBF0);
  static const blue = Color(0xFF3B82F6);
  static const blueSoft = Color(0xFFEAF2FF);
  static const background = Color(0xFFF8FAFC);
  static const ink = Color(0xFF102016);
  static const muted = Color(0xFF64706A);
  static const border = Color(0xFFE6ECE8);
  static const darkCamera = Color(0xFF111827);
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          child: Column(
            children: [
              const AppLogo(size: 74),
              const SizedBox(height: 18),
              Text(
                'Smart Waste',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Pilah sampah lebih mudah dengan AI',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const WasteSortingIllustration(),
              const Spacer(),
              PrimaryButton(
                label: 'Mulai',
                icon: Icons.arrow_forward_rounded,
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const AppLogo(size: 42),
                  const SizedBox(width: 12),
                  Text(
                    'Smart Waste',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton.filledTonal(
                    tooltip: 'Info aplikasi',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const AboutScreen(),
                      ),
                    ),
                    icon: const Icon(Icons.info_outline_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 52),
              const ScanCard(),
              const SizedBox(height: 22),
              PrimaryButton(
                label: 'Buka Kamera',
                icon: Icons.photo_camera_rounded,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const CaptureScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                label: 'Pilih dari Galeri',
                icon: Icons.photo_library_rounded,
                onPressed: () => _openProcessing(context),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkCamera,
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned.fill(child: CameraPreviewPlaceholder()),
            Positioned(
              left: 20,
              top: 16,
              child: IconButton.filled(
                tooltip: 'Kembali',
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.14),
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            ),
            Center(
              child: Container(
                width: 238,
                height: 238,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.74),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Posisikan sampah\ndi dalam bingkai',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.88),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton.filledTonal(
                    tooltip: 'Pilih dari galeri',
                    style: IconButton.styleFrom(
                      fixedSize: const Size(56, 56),
                      backgroundColor: Colors.white.withValues(alpha: 0.16),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _openProcessing(context),
                    icon: const Icon(Icons.photo_library_rounded),
                  ),
                  ShutterButton(onPressed: () => _openProcessing(context)),
                  const SizedBox(width: 56, height: 56),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) =>
              const ResultScreen(result: WasteResult.organic, confidence: 0.94),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ScannedPhotoPlaceholder(height: 210),
                const SizedBox(height: 34),
                const SizedBox(
                  width: 44,
                  height: 44,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    color: AppColors.green,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Menganalisis sampah...',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum WasteResult { organic, inorganic }

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.result,
    required this.confidence,
  });

  final WasteResult result;
  final double confidence;

  bool get isOrganic => result == WasteResult.organic;

  @override
  Widget build(BuildContext context) {
    final accent = isOrganic ? AppColors.green : AppColors.blue;
    final soft = isOrganic ? AppColors.greenSoft : AppColors.blueSoft;
    final label = isOrganic ? 'ORGANIK' : 'ANORGANIK / DAUR ULANG';
    final recommendation = isOrganic
        ? 'Bisa dijadikan kompos atau pakan ternak. Pisahkan dari plastik agar proses pengolahan tetap bersih.'
        : 'Pisahkan dan setor ke bank sampah untuk didaur ulang. Bersihkan sisa makanan sebelum disimpan.';
    final percent = (confidence * 100).round();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    tooltip: 'Kembali',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Hasil Analisis',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const ScannedPhotoPlaceholder(height: 218),
              const SizedBox(height: 22),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: soft,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: accent.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: accent,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              CleanCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Akurasi: $percent%',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        Icon(Icons.verified_rounded, color: accent, size: 22),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        value: confidence,
                        color: accent,
                        backgroundColor: AppColors.border,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              CleanCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rekomendasi Penanganan',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      recommendation,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Scan Lagi',
                icon: Icons.camera_alt_rounded,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
                  (_) => false,
                ),
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                label: 'Selesai',
                icon: Icons.check_rounded,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
                  (_) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    tooltip: 'Kembali',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Tentang Aplikasi',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Smart Waste menggunakan model CNN di perangkat untuk membantu mengenali jenis sampah rumah tangga dari foto, lalu memberi saran penanganan yang sederhana dan praktis.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              InfoCard(
                icon: Icons.eco_rounded,
                color: AppColors.green,
                title: 'Organik',
                description:
                    'Sisa makanan, daun, kulit buah, sayuran, dan bahan alami lain yang mudah terurai.',
              ),
              const SizedBox(height: 14),
              InfoCard(
                icon: Icons.recycling_rounded,
                color: AppColors.blue,
                title: 'Anorganik',
                description:
                    'Plastik, kaleng, kaca, botol, kardus, dan bahan yang dapat dipilah untuk didaur ulang.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        borderRadius: BorderRadius.circular(size * 0.28),
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

class WasteSortingIllustration extends StatelessWidget {
  const WasteSortingIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 30,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _BinIcon(
            icon: Icons.eco_rounded,
            label: 'Organik',
            color: AppColors.green,
          ),
          const SizedBox(width: 18),
          Container(width: 1, height: 86, color: AppColors.border),
          const SizedBox(width: 18),
          _BinIcon(
            icon: Icons.recycling_rounded,
            label: 'Daur Ulang',
            color: AppColors.blue,
          ),
        ],
      ),
    );
  }
}

class _BinIcon extends StatelessWidget {
  const _BinIcon({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(icon, color: color, size: 36),
        ),
        const SizedBox(height: 10),
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

class ScanCard extends StatelessWidget {
  const ScanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CleanCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 42),
      child: Column(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              color: AppColors.greenSoft,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(
              Icons.photo_camera_rounded,
              color: AppColors.green,
              size: 42,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Scan Sampah',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Ambil foto sampah rumah tangga untuk mengetahui kategorinya.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CleanCard extends StatelessWidget {
  const CleanCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F0F172A),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

class CameraPreviewPlaceholder extends StatelessWidget {
  const CameraPreviewPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1F2937), Color(0xFF0F172A)],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.photo_camera_outlined,
          color: Colors.white.withValues(alpha: 0.14),
          size: 128,
        ),
      ),
    );
  }
}

class ScannedPhotoPlaceholder extends StatelessWidget {
  const ScannedPhotoPlaceholder({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFEFFDF4), Color(0xFFEAF2FF)],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.82),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.image_search_rounded,
                color: AppColors.muted,
                size: 44,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 14,
            child: Text(
              'Foto sampah',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.ink,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShutterButton extends StatelessWidget {
  const ShutterButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 78,
        height: 78,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 5),
        ),
        child: Center(
          child: Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CleanCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: FilledButton.icon(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.ink,
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
        ),
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}

void _openProcessing(BuildContext context) {
  Navigator.of(
    context,
  ).push(MaterialPageRoute<void>(builder: (_) => const ProcessingScreen()));
}
