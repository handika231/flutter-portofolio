import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/common/constant.dart';
import 'package:presence_app/injector.dart' as di;

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final controller = Get.put(di.locator<ProfileController>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile View'),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.status.value == Status.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: controller.user['profile'] == null
                          ? NetworkImage(
                              'https://ui-avatars.com/api/?name=${controller.user['name']}',
                            )
                          : NetworkImage(controller.user['profile']),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Name: ${controller.user['name']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Name: ${controller.user['email']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.UPDATE_PROFILE,
                          arguments: controller.user);
                    },
                    title: const Text('Update Profile'),
                    leading: const Icon(Icons.person),
                  ),
                  controller.user['role'] == 'admin'
                      ? ListTile(
                          onTap: () {
                            Get.toNamed(Routes.ADD_EMPLOYEE);
                          },
                          leading: const Icon(Icons.add_reaction),
                          title: const Text('Add Pegawai'),
                        )
                      : const SizedBox(),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                  ),
                ],
              );
      }),
    );
  }
}
