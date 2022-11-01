import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data?.data();
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://ui-avatars.com/api/?name=${user?['name']}',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Name: ${user?['name']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Name: ${user?['email']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.UPDATE_PROFILE, arguments: user);
                  },
                  title: const Text('Update Profile'),
                  leading: const Icon(Icons.person),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.password),
                  title: const Text('Update Password'),
                ),
                user?['role'] == 'admin'
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        stream: controller.getEmployee(),
      ),
    );
  }
}
