import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TunawicaraScreen extends StatefulWidget {
  @override
  _TunawicaraScreenState createState() => _TunawicaraScreenState();
}

class _TunawicaraScreenState extends State<TunawicaraScreen> {
  List<dynamic> posts = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchTunawicaraPosts();
  }

  Future<void> fetchTunawicaraPosts() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.56.1/api/get_tunawicara_posts.php'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['success'] == true && jsonData['data'] is List) {
          setState(() {
            posts = jsonData['data'];
            isLoading = false;
          });
        } else {
          throw FormatException("Response JSON tidak memiliki field 'data' yang benar");
        }
      } else {
        throw Exception("HTTP error: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi Tunawicara"),
        backgroundColor: Color(0xFF5D2C04),
      ),
      backgroundColor: Color(0xFFC58244),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : (errorMessage != null
              ? Center(
                  child: Text(
                    "Error: $errorMessage",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return Card(
                      margin: EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post['title'] ?? '-',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 8),
                            Text(
                              post['content'] ?? '-',
                              style: TextStyle(fontSize: 14),
                            ),
                            if (post['url'] != null && post['url'].toString().isNotEmpty)
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "URL: ${post['url']}",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
