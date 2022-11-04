import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';

class LastDayWidget extends StatelessWidget {
  const LastDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Last 5 Days',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.ALL_PRESENCE);
              },
              child: const Text('See All'),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL_PRESENCE);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(DateTime.now()),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      DateFormat.jms().format(DateTime.now()),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Keluar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      DateFormat.jms().format(
                        DateTime.now().add(
                          const Duration(hours: 8),
                        ),
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
