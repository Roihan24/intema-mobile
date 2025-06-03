import 'package:flutter/material.dart';
import 'accessibility_screen.dart';
import 'detail_screen.dart'; // pastikan file ini ada

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> allItems = [
    {'category': 'Makanan', 'name': 'Nasi Telor Gimbal', 'price': 13000},
    {'category': 'Makanan', 'name': 'Nasi Telor Urak-Arik', 'price': 12000},
    {'category': 'Makanan', 'name': 'Nasi Goreng Kampung', 'price': 15000},
    {'category': 'Makanan', 'name': 'Nasi Ayam Serundeng', 'price': 22000},
    {'category': 'Makanan', 'name': 'Nasi Goreng Istimewa', 'price': 22000},
    {'category': 'Makanan', 'name': 'Nasi Gila', 'price': 15000},
    {'category': 'Makanan', 'name': 'Nasi Telor Pelangi', 'price': 13000},
    {'category': 'Makanan', 'name': 'Extra Nasi Putih', 'price': 5000},
    {'category': 'Makanan', 'name': 'Extra Telor(Ceplok/Dadar)', 'price': 5000},
    {'category': 'Makanan', 'name': 'Extra Sosis Besar', 'price': 8000},
    {'category': 'Cemilan', 'name': 'Sosis Bakar', 'price': 15000},
    {'category': 'Cemilan', 'name': 'Cireng Rujak', 'price': 12000},
    {'category': 'Cemilan', 'name': 'Cireng Sambel Bojot', 'price': 12000},
    {'category': 'Cemilan', 'name': 'Cireng Kuah', 'price': 15000},
    {'category': 'Cemilan', 'name': 'Kentang Goreng', 'price': 10000},
    {'category': 'Cemilan', 'name': 'Mix Platter', 'price': 15000},
    {'category': 'Cemilan', 'name': 'Pisang Coklat Lumer', 'price': 12000},
    {'category': 'Cemilan', 'name': 'Pisang Coklat Keju', 'price': 12000},
    {'category': 'Cemilan', 'name': 'Kue Sayur', 'price': 12000},
    {'category': 'Minuman', 'name': 'Kopi Tubruk', 'price': 15000},
    {'category': 'Minuman', 'name': 'Americano', 'price': 15000},
    {'category': 'Minuman', 'name': 'Espresso', 'price': 13000},
    {'category': 'Minuman', 'name': 'Japanese', 'price': 20000},
    {'category': 'Minuman', 'name': 'V60', 'price': 20000},
    {'category': 'Minuman', 'name': 'Vietnam Drip', 'price': 17000},
    {'category': 'Minuman', 'name': '*Extra Shoot', 'price': 7000},
    {'category': 'Minuman', 'name': 'Kopi Susu Istimewa', 'price': 18000},
    {'category': 'Minuman', 'name': 'Kopi Susu Caramel', 'price': 18000},
    {'category': 'Minuman', 'name': 'Kopi Susu Hazelnut', 'price': 18000},
    {'category': 'Minuman', 'name': 'Kopi Susu Vanilla', 'price': 18000},
    {'category': 'Minuman', 'name': 'Kopi Susu Butterscotch', 'price': 18000},
    {'category': 'Minuman', 'name': 'Kopi Susu Murni', 'price': 18000},
    {'category': 'Minuman', 'name': '*Extra Es Batu Cup', 'price': 18000},
    {'category': 'Minuman', 'name': 'Susu Aren', 'price': 15000},
    {'category': 'Minuman', 'name': 'Susu Caramel', 'price': 15000},
    {'category': 'Minuman', 'name': 'Susu Hazelnut', 'price': 15000},
    {'category': 'Minuman', 'name': 'Susu Vanilla', 'price': 15000},
    {'category': 'Minuman', 'name': 'Susu Butterscotch', 'price': 15000},
    {'category': 'Minuman', 'name': 'Susu Murni', 'price': 10000},
    {'category': 'Minuman', 'name': 'Chocholate', 'price': 16000},
    {'category': 'Minuman', 'name': 'Matcha', 'price': 16000},
    {'category': 'Minuman', 'name': 'Red Velvet', 'price': 16000},
    {'category': 'Minuman', 'name': 'Air Mineral', 'price': 5000},
  ];

  String selectedCategory = 'Makanan';

  @override
  Widget build(BuildContext context) {
    final filteredItems = allItems
        .where((item) => item['category'] == selectedCategory)
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFFC58244),
      appBar: AppBar(
        backgroundColor: Color(0xFF5D2C04),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AccessibilityScreen()),
            );
          },
        ),
        title: Text("Menu", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFB87333),
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton('Makanan', Icons.restaurant),
                _buildCategoryButton('Cemilan', Icons.fastfood),
                _buildCategoryButton('Minuman', Icons.local_cafe),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 3 / 4,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD87A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.restaurant, size: 60, color: Colors.brown[800]),
                      Column(
                        children: [
                          Text(
                            'Rp${item['price']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                          Text(
                            item['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            shape: CircleBorder(),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(
                                  name: item['name'],
                                  price: item['price'],
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.add, size: 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category, IconData icon) {
    final isSelected = category == selectedCategory;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF5D2C04) : Color(0xFFFFD87A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.brown),
            SizedBox(height: 4),
            Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
