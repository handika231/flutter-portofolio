import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_presence_controller.dart';

class AllPresenceView extends GetView<AllPresenceController> {
  const AllPresenceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllPresenceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AllPresenceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
