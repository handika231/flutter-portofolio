import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/detail/detail_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/style/app_style.dart';

class DetailView extends GetView<DetailController> {
  final NewsModel args = Get.arguments;
  DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.primaryColor,
        onPressed: () {
          Get.bottomSheet(
            Form(
              key: controller.formKey,
              child: Container(
                height: Get.height * 0.8,
                color: Colors.white,
                child: ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    _buildForm('Nama', controller.nameController),
                    const SizedBox(
                      height: 12,
                    ),
                    _buildForm('Email', controller.emailController),
                    const SizedBox(
                      height: 12,
                    ),
                    _buildForm('Komentar', controller.commentController, true),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyle.primaryColor,
                        fixedSize: const Size(160, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.postComment(
                            args.slug.toString(),
                          );
                        }
                      },
                      child: const Text(
                        "Post Komentar",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.comment),
      ),
      body: FutureBuilder(
        future: controller.fetchNewsBySlug(args.slug.toString()),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.lightBlue,
                size: 65.0,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: args.id.toString(),
                    child: Image.network(
                      args.image ?? 'https://via.placeholder.com/150',
                      width: Get.width,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          args.title ?? 'No Title',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                          color: AppStyle.greyColor,
                        ),
                        Text(
                          args.description ?? 'No Description',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: AppStyle.light,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              args.createdAt ?? 'No Date',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: AppStyle.light,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Chip(
                          avatar: const Icon(
                            Icons.home,
                            size: 12,
                          ),
                          label: Text(
                            args.category?.name ?? 'No Category',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: AppStyle.light,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          'Komentar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Comments data = args.comments![index];
                            return Card(
                              color: AppStyle.secondaryColor,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 16,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          data.name.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: AppStyle.medium,
                                          ),
                                        ),
                                        Text(
                                          data.createdAt.toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: AppStyle.light,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      data.comment.toString(),
                                      style: const TextStyle(
                                        fontWeight: AppStyle.light,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: args.comments!.length,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  TextFormField _buildForm(String name, TextEditingController controller,
      [bool isComment = false]) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Nama tidak boleh kosong' : null,
      controller: controller,
      maxLines: isComment ? 5 : 1,
      decoration: InputDecoration(
        labelText: name,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
