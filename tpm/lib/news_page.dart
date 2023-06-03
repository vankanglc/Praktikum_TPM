import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'NewsDetailPage.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> news = [];

  Future<void> fetchNews() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/everything?q=football&apiKey=c903743fc0c742799bce6bb0f6b9890d'),
    );

    if (response.statusCode == 200) {
      setState(() {
        news = json.decode(response.body)['articles'];
      });
    } else {
      // Error handling
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Tambahkan padding vertical
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          final title = news[index]['title'];
          final author = news[index]['author'];
          final description = news[index]['description'];
          final content = news[index]['content'];
          final imageUrl = news[index]['urlToImage'] ?? 'https://example.com/default_image.jpg';

          return Padding( // Tambahkan Padding untuk menambahkan ruang antara setiap berita
            padding: const EdgeInsets.only(bottom: 8.0), // Tambahkan ruang bawah
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailScreen(
                      title: title ?? 'No Title',
                      author: author ?? 'No Author',
                      imageUrl: imageUrl,
                      description: description ?? 'No Description',
                      content: content ?? 'No Content',
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[200],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrl,
                        height: 150.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      title ?? 'No Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'By $author' ?? 'No Author',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}