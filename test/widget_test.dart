import 'dart:typed_data';  // <- ini harus ada
import 'package:flutter_test/flutter_test.dart';
import 'package:intema/main.dart';
import 'package:intema/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized().defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) async {
      return ByteData(0);  // ByteData kosong supaya Image.asset gak error
    });
  });

testWidgets('WelcomeScreen tampil dengan benar di MyApp', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());

  expect(find.byType(MaterialApp), findsOneWidget);
  expect(find.byType(WelcomeScreen), findsOneWidget);
  expect(find.text('SELAMAT DATANG'), findsOneWidget);
  expect(find.widgetWithText(ElevatedButton, 'MASUK'), findsOneWidget);

  await tester.tap(find.widgetWithText(ElevatedButton, 'MASUK'));
  await tester.pumpAndSettle();

  // Ubah 'Login' ke 'MASUK' atau 'Masuk'
  expect(find.text('MASUK'), findsOneWidget);
});

}
