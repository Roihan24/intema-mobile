import 'package:flutter/material.dart';

class AccessibilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC58244), // coklat muda
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5D2C04), // coklat tua
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text("LOGOUT", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 40),

              // MENU Section
              Center(
                child: Column(
                  children: [
                    Text(
                      "Menu Makan dan Minum",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/menu'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5D2C04),
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "MENU",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),

              // Informasi Section
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pilihan Informasi",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    _buildInfoButton(
                      context,
                      icon: Icons.hearing,
                      label: "TUNARUNGU",
                      onTap: () => Navigator.pushNamed(context, '/tunarungu'),
                    ),
                    SizedBox(height: 16),
                    _buildInfoButton(
                      context,
                      icon: Icons.sign_language,
                      label: "TUNAWICARA",
                      onTap: () => Navigator.pushNamed(context, '/tunawicara'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoButton(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Color(0xFF5D2C04)),
      label: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF5D2C04),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
