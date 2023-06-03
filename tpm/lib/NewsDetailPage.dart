import 'package:flutter/material.dart';
import 'favorite_page.dart';

class NewsDetailScreen extends StatefulWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final String content;
  const NewsDetailScreen({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    required this.content,
  });

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  bool isFavorited = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
      if (isFavorited) {
        isFavorited = true;
        FavoritePage.addFavoriteNews(FavoriteNews(
          title: widget.title,
          author: widget.author,
          imageUrl: widget.imageUrl,
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Add to favorite',
            ),
            backgroundColor: Color(0xFF000000),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      } else {
        isFavorited = false;
        FavoritePage.removeFavoriteNews(FavoriteNews(
          title: widget.title,
          author: widget.author,
          imageUrl: widget.imageUrl,
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Removed from favorite'),
            backgroundColor: Colors.redAccent,
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'By ${widget.author}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    widget.content,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: isFavorited ? Colors.red : null,
                      ),
                      onPressed: toggleFavorite,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
