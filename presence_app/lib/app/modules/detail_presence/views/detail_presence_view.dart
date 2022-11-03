import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/detail_presence_controller.dart';

class DetailPresenceView extends GetView<DetailPresenceController> {
  const DetailPresenceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Presence'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    DateFormat.yMMMMEEEEd().format(
                      DateTime.now(),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Check In ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Jam: ${DateFormat.jms().format(
                    DateTime.now(),
                  )}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Posisi: ${DateFormat.jms().format(
                    DateTime.now(),
                  )}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Status: ${DateFormat.jms().format(
                    DateTime.now(),
                  )}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Check Out ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Jam: ${DateFormat.jms().format(
                    DateTime.now(),
                  )}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Posisi: ${DateFormat.jms().format(
                    DateTime.now(),
                  )}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Status: ${DateFormat.jms().format(
                    DateTime.now(),
                  )}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
