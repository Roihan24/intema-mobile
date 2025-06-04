import 'package:flutter_test/flutter_test.dart';
import 'package:intema/main.dart';
import 'package:intema/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('WelcomeScreen tampil dengan benar di MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Cek ada widget MaterialApp
    expect(find.byType(MaterialApp), findsOneWidget);

    // Karena initialRoute adalah '/', cek WelcomeScreen muncul
    expect(find.byType(WelcomeScreen), findsOneWidget);

    // Cek teks 'SELAMAT DATANG' muncul
    expect(find.text('SELAMAT DATANG'), findsOneWidget);

    // Cek tombol 'MASUK' muncul
    expect(find.widgetWithText(ElevatedButton, 'MASUK'), findsOneWidget);

    // Simulasi tap tombol 'MASUK' dan cek pindah ke route /login
    await tester.tap(find.widgetWithText(ElevatedButton, 'MASUK'));
    await tester.pumpAndSettle();

    // Setelah tap, harusnya pindah ke LoginScreen
    // Jadi cek ada widget LoginScreen
    expect(find.text('Login'), findsOneWidget);  // Contoh asumsi LoginScreen ada teks 'Login'
  });
}
