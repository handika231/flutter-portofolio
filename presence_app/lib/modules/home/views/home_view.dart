import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/common/constant.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/home_controller.dart';
import '../widgets/last_day_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(di.locator<HomeController>());

  @override
  void initState() {
    super.initState();
    Future.microtask(() => Get.find<HomeController>().fetchEmployee());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.status.value == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Row(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.user['profile'] ??
                                'https://ui-avatars.com/api/?name=${controller.user['name']}',
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          child: Text(
                            controller.user['address'] ?? 'Belum ada lokasi',
                            softWrap: true,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.user['role']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        '${controller.user['nip']}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Name: ${controller.user['name']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text('Masuk'),
                            Text('08:00'),
                          ],
                        ),
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        Column(
                          children: const [
                            Text('Keluar'),
                            Text('14:00'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const LastDayWidget(),
              ],
            );
          }
        }),
      ),
    );
  }
}
