import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'midtrans_payment_screen.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final int price;

  DetailScreen({required this.name, required this.price});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  String option = ''; // Pedas/Tidak Pedas atau Hot/Ice

  @override
  void initState() {
    super.initState();
    // Default pilihan berdasarkan jenis item
    if (isMakanan(widget.name)) {
      option = 'Pedas';
    } else if (isMinuman(widget.name)) {
      option = 'Hot';
    }
  }

  bool isMakanan(String name) {
    final makananKeywords = ['Nasi', 'Ayam', 'Telor', 'Sosis', 'Kue', 'Kentang', 'Cireng'];
    return makananKeywords.any((keyword) => name.contains(keyword));
  }

  bool isMinuman(String name) {
    final minumanKeywords = ['Kopi', 'V60', 'Japanese', 'Vietnam'];
    return minumanKeywords.any((keyword) => name.contains(keyword));
  }

  Future<void> handlePayment() async {
    final amount = widget.price * quantity;

    final response = await http.post(
      Uri.parse('http://10.0.2.2/api/create_transaction.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'amount': amount}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MidtransPaymentScreen(snapUrl: data['token']),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? 'Transaksi gagal')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal terhubung ke server")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMkn = isMakanan(widget.name);
    final isMnm = isMinuman(widget.name);

    return Scaffold(
      backgroundColor: Color(0xFFC58244),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 24),
            decoration: BoxDecoration(
              color: Color(0xFF5D2C04),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFFFFD87A),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color(0xFFB87333),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF5D2C04),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(Icons.restaurant, size: 100, color: Color(0xFFFFD87A)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Rp${widget.price}', style: TextStyle(fontSize: 16)),
                  Text(widget.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),

                  if (isMkn || isMnm)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildOptionButton(
                          isMkn ? 'Pedas' : 'Hot',
                          option == (isMkn ? 'Pedas' : 'Hot'),
                        ),
                        SizedBox(width: 12),
                        _buildOptionButton(
                          isMkn ? 'Tidak Pedas' : 'Ice',
                          option == (isMkn ? 'Tidak Pedas' : 'Ice'),
                        ),
                      ],
                    ),

                  Spacer(),
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xFF5D2C04),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFD87A),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 12),
                Text('$quantity', style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFD87A),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Icon(Icons.add),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: handlePayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFD87A),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Pesan", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String label, bool selected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          option = label;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Color(0xFF5D2C04) : Color(0xFFFFD87A),
        foregroundColor: selected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label),
    );
  }
}
