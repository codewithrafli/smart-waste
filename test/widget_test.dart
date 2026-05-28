import 'package:flutter_test/flutter_test.dart';
import 'package:smart_waste_management/main.dart';

void main() {
  testWidgets('opens the Smart Waste home flow', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartWasteApp());

    expect(find.text('Smart Waste'), findsOneWidget);
    expect(find.text('Pilah sampah lebih mudah dengan AI'), findsOneWidget);

    await tester.tap(find.text('Mulai'));
    await tester.pumpAndSettle();

    expect(find.text('Scan Sampah'), findsOneWidget);
    expect(find.text('Buka Kamera'), findsOneWidget);
    expect(find.text('Pilih dari Galeri'), findsOneWidget);
  });
}
