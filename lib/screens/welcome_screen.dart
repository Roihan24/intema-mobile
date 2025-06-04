import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC58244),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 250,
              ),
              const SizedBox(height: 100),
              const Text(
                'SELAMAT DATANG',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFDD62),
                ),
              ),
              const Text(
                'DI LAYANAN INFORMASI TEMAN ISTIMEWA',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFFDD62),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A2D0C),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'MASUK',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
