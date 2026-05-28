import 'waste_category.dart';

class ScanResult {
  const ScanResult({
    required this.category,
    required this.confidence,
    required this.processingTime,
    required this.modelName,
  });

  final WasteCategory category;
  final double confidence;
  final Duration processingTime;
  final String modelName;

  static const demo = ScanResult(
    category: WasteCategory.organic,
    confidence: 0.94,
    processingTime: Duration(milliseconds: 820),
    modelName: 'CNN MobileNetV2 On-device',
  );
}
