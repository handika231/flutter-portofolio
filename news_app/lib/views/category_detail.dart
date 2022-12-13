import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/category/category_controller.dart';
import 'package:news_app/model/category_by_slug_model.dart';
import 'package:news_app/style/app_style.dart';

class CategoryDetail extends GetView<CategoryController> {
  final argument = Get.arguments;
  CategoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.fetchCategoryBySlug(argument),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.data == null) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              );
            } else {
              CategoryBySlugModel data = snapshot.data;
              return data.posts!.isEmpty ? _buildEmpty() : _buildHasData(data);
            }
          },
        ),
      ),
    );
  }

  Widget _buildHasData(CategoryBySlugModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 24),
          child: Text(
            'Category: ${data.name}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: AppStyle.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: data.posts?.length,
            itemBuilder: (BuildContext context, int index) {
              Posts post = data.posts![index];
              return Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          post.image ?? 'https://via.placeholder.com/150',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title ?? '',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: AppStyle.medium,
                            ),
                          ),
                          const Divider(
                            thickness: 0.4,
                            color: AppStyle.greyColor,
                          ),
                          Text(
                            post.content ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: AppStyle.light,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/empty.png',
            cacheHeight: Get.width.toInt(),
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Tidak terdapat berita pada kategori ini',
            style: TextStyle(
              fontSize: 20,
              fontWeight: AppStyle.medium,
            ),
          ),
        ],
      ),
    );
  }
}
