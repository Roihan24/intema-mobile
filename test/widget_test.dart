import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intema/main.dart';
import 'package:intema/screens/welcome_screen.dart';
import 'package:intema/screens/login_screen.dart';

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    if (key == 'assets/logo.png') {
      // Berikan ByteData valid minimal agar image tidak error
      // Di sini kita buat dummy 1x1 transparent PNG bytes
      final transparentImage = <int>[
        0x89, 0x50, 0x4E, 0x47,
        0x0D, 0x0A, 0x1A, 0x0A,
        0x00, 0x00, 0x00, 0x0D,
        0x49, 0x48, 0x44, 0x52,
        0x00, 0x00, 0x00, 0x01,
        0x00, 0x00, 0x00, 0x01,
        0x08, 0x06, 0x00, 0x00,
        0x00, 0x1F, 0x15, 0xC4,
        0x89, 0x00, 0x00, 0x00,
        0x0A, 0x49, 0x44, 0x41,
        0x54, 0x78, 0x9C, 0x63,
        0x00, 0x01, 0x00, 0x00,
        0x05, 0x00, 0x01, 0x0D,
        0x0A, 0x2D, 0xB4, 0x00,
        0x00, 0x00, 0x00, 0x49,
        0x45, 0x4E, 0x44, 0xAE,
        0x42, 0x60, 0x82
      ];
      return ByteData.view(Uint8List.fromList(transparentImage).buffer);
    }
    return rootBundle.load(key);
  }
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('WelcomeScreen tampil dengan benar di MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(
      DefaultAssetBundle(
        bundle: TestAssetBundle(),
        child: MyApp(),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(WelcomeScreen), findsOneWidget);
    expect(find.text('SELAMAT DATANG'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'MASUK'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'MASUK'));
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
