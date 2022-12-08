import 'package:book_app/views/favorite_page.dart';
import 'package:book_app/views/library_page.dart';
import 'package:book_app/views/profile_page.dart';
import 'package:flutter/material.dart';

import '../views/home_view.dart';

class MainNotifier extends ChangeNotifier {
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> views = [
    const HomeView(),
    const LibraryPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  List<Widget> destination = [
    const NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const NavigationDestination(
      icon: Icon(Icons.library_books),
      label: 'Library',
    ),
    const NavigationDestination(
      icon: Icon(Icons.bookmark),
      label: 'Favorite',
    ),
    const NavigationDestination(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
}
