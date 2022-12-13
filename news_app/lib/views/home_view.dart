import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home/home_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/routes/name_routes.dart';
import 'package:news_app/style/app_style.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 16),
                child: Image.asset(
                  'assets/logo-transparent.png',
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: controller.fetchAllCategory(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.lightBlue,
                        size: 30.0,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                      ),
                      child: Wrap(
                        spacing: 8,
                        children: controller.categoryList
                            .map(
                              (category) => ActionChip(
                                backgroundColor: AppStyle.primaryColor,
                                avatar: CircleAvatar(
                                  backgroundColor:
                                      AppStyle.primaryColor.withOpacity(0.5),
                                  child: const Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                                onPressed: () {},
                                label: Text(
                                  category.name ?? '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: AppStyle.light,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => _buildCarousel(context),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, bottom: 16),
                child: Text(
                  'Berita Hari ini',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: AppStyle.bold,
                  ),
                ),
              ),
              FutureBuilder(
                future: controller.fetchAllNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.data == null) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: Colors.lightBlue,
                        size: 65.0,
                      ),
                    );
                  } else {
                    List<NewsModel> news = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: news.length,
                      itemBuilder: (BuildContext context, int index) {
                        NewsModel data = news[index];
                        return _buildItem(data);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(NewsModel data) {
    return Card(
      margin: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 16,
      ),
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Hero(
              tag: data.id.toString(),
              child: Image.network(
                data.image ?? 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                height: 180,
                width: 150,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data.title}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: AppStyle.medium,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.home,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${data.category?.name}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: AppStyle.light,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.today,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                        child: Text(
                          '${data.createdAt}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: AppStyle.light,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.detail, arguments: data);
                    },
                    child: const Text(
                      "Selengkapnya...",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCarousel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          carouselController: controller.controller,
          items: controller.listCarousel
              .map(
                (item) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    cacheHeight: 200,
                    cacheWidth: Get.width.toInt(),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              controller.currentIndex.value = index;
            },
            height: 200,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.listCarousel.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppStyle.primaryColor)
                      .withOpacity(
                    controller.currentIndex.value == entry.key ? 0.9 : 0.4,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
