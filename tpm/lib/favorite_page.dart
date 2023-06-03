import 'package:flutter/material.dart';

class FavoriteNews {
  final String title;
  final String author;
  final String imageUrl;

  FavoriteNews({
    required this.title,
    required this.author,
    required this.imageUrl,
  });
}

class FavoritePage extends StatefulWidget {
  static List<FavoriteNews> favoriteNewsList = [];

  static void addFavoriteNews(FavoriteNews news) {
    favoriteNewsList.add(news);
  }

  static void removeFavoriteNews(FavoriteNews news) {
    favoriteNewsList.remove(news);
  }

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: FavoritePage.favoriteNewsList.length,
        itemBuilder: (BuildContext context, int index) {
          final news = FavoritePage.favoriteNewsList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      news.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          news.author,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
