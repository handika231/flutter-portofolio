import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/common/style.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/presence_controller.dart';

class PresenceView extends StatelessWidget {
  PresenceView({Key? key}) : super(key: key);
  final controller = Get.put(di.locator<PresenceController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presence View'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 10,
                      color: blueColor,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    onLongPress: () {
                      controller.updatePosition();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Icon(
                        Icons.fingerprint,
                        size: 100,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              controller.positionNow.value.isEmpty
                  ? const Text('Belum Absen')
                  : Text(
                      'Sudah Absen, Posisi: ${controller.positionNow.value}',
                      style: const TextStyle(fontSize: 20),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
