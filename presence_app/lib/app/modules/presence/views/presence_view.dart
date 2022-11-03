import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/presence_controller.dart';

class PresenceView extends GetView<PresenceController> {
  PresenceView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(PresenceController());

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
                    border: Border.all(width: 10, color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100.0),
                    onTap: () {
                      controller.updatePosition();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Icon(
                        Icons.fingerprint,
                        size: 100,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Positioned: ${controller.positionNow.value}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
