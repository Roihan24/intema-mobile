import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC58244),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 250), // Sesuaikan logo
              SizedBox(height: 100),
              Text(
                'SELAMAT DATANG',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: const Color(0xFFFFDD62),),
              ),
              Text(
                'DI LAYANAN INFORMASI TEMAN ISTIMEWA',
                style: TextStyle(fontSize: 16, color: const Color(0xFFFFDD62)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 90, 45, 12),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('MASUK', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
