import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/optscreen.controller.dart';

class OptscreenScreen extends GetView<OptscreenController> {
  const OptscreenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OptscreenScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed('/home');
          },
          child: const Text(
            'OptscreenScreen is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
