import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:news_app/services/api_service.dart';

import '../../model/news_model.dart';

class HomeController extends GetxController {
  ApiService service = ApiService();
  final List listCarousel = [
    'assets/slider/slider1.jpg',
    'assets/slider/slider2.jpg',
    'assets/slider/slider3.jpg',
    'assets/slider/slider4.jpg',
    'assets/slider/slider5.jpg'
  ];
  RxInt currentIndex = 0.obs;
  final CarouselController controller = CarouselController();
  final newsList = <NewsModel>[].obs;
  onPageChange(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }

  Future<List<NewsModel>> fetchAllNews() async {
    try {
      final news = await service.fetchAllNews();
      if (news.isNotEmpty) {
        newsList.assignAll(news);
      }
      return newsList;
    } catch (err) {
      throw Exception(err);
    }
  }
}
