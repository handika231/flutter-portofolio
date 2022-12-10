import 'package:book_app/model/ebook_model/ebook_model.dart';
import 'package:book_app/utils/api_service.dart';
import 'package:book_app/utils/result_state.dart';
import 'package:book_app/views/favorite_page.dart';
import 'package:book_app/views/library_page.dart';
import 'package:book_app/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../views/home_view.dart';

@injectable
class MainNotifier extends ChangeNotifier {
  ApiServices service;
  MainNotifier(this.service);
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  int sliderPosition = 0;

  void changeSlider(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  void changeSliderPosition(int index) {
    sliderPosition = index;
    notifyListeners();
  }

  PageController pageController = PageController(
    initialPage: 0,
  );

  ResultState state = ResultState.noData;
  List<EbookModel> listOfSliders = [];
  List<EbookModel> listOfLatest = [];
  String message = '';

  Future<void> getSlider() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      final result = await service.fetchSlider();
      result.fold(
        (failure) => message = failure.message,
        (data) => listOfSliders = data,
      );
      state = ResultState.hasData;
      notifyListeners();
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
  }

  Future<void> getLatest() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      final result = await service.fetchLatest();
      result.fold(
        (failure) => message = failure.message,
        (data) => listOfLatest = data,
      );
      state = ResultState.hasData;
      notifyListeners();
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
    }
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
