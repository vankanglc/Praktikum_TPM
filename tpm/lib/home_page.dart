import 'package:flutter/material.dart';
import 'package:tpm/camera_page.dart';
import 'package:tpm/news_page.dart';
import 'package:tpm/favorite_page.dart';
import 'package:tpm/konveksi_page.dart';
import 'package:tpm/profile_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _screens = [
    NewsPage(),
    FavoritePage(),
    KonveksiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Others',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Warna ikon dan label yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon dan label yang tidak dipilih
        onTap: _onItemTapped,
      ),
    );
  }
}
